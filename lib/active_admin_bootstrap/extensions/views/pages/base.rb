module ActiveAdmin
  module Views
    module Pages
      # Overwrite activeadmin/lib/active_admin/views/pages/base.rb
      class Base < Arbre::HTML::Document
        include ::ActiveAdminBootstrap::Configs::Finders

        has_css_classes_for :body, :content, :flash
        has_layouts_for :sidebar, :navigation

        SIDEBAR_OPTS = %w[left right].freeze

        def build(*_args)
          unless SIDEBAR_OPTS.include?(sidebar_layouts)
            raise "Invalid layout option for sidebar. Available options are: #{SIDEBAR_OPTS.join(", ")}"
          end

          set_attribute :lang, I18n.locale
          build_active_admin_head
          build_page
          build_breakpoint_helpers
        end

        private

        def build_breakpoint_helpers
          div id: "breakpoint-helpers" do
            span class: "breakpoint-up-helper"
            span class: "breakpoint-down-helper"
          end
        end

        def build_page
          within body(class: body_classes) do
            header(active_admin_namespace, current_menu)
            title_bar(active_admin_namespace, title, action_items_for_action)

            div id: "wrapper" do
              build_flash_messages
              build_unsupported_browser
              build_page_content
              # build_extra_components
            end
          end
        end

        def build_extra_components
          div id: "bottom-nav" do
            float_actions(float_actions_for_action) unless skip_float_actions?
          end

          htmls(htmls_for_action) unless skip_htmls?
        end

        def build_page_content
          div id: "active_admin_content" do
            contents = %i[build_body_content build_sidebar_content]
            contents.reverse! if sidebar_layouts&.eql?(SIDEBAR_OPTS[0])
            contents.each { |x| send(x) }
          end
        end

        def build_body_content
          div id: "main", class: sidebar_class do
            div class: content_wrapper_class do
              build_main_content_wrapper
              footer active_admin_namespace
            end
          end
        end

        def build_sidebar_content
          return if skip_sidebar?

          div sidebar(sidebar_sections_for_action, class: "container"), id: "sidebar"
        end

        def htmls_for_action
          if active_admin_config&.htmls?
            active_admin_config.htmls_for(params[:action], self)
          else []
          end
        end

        def float_actions_for_action
          if active_admin_config&.float_actions?
            active_admin_config.float_actions_for(params[:action], self)
          else []
          end
        end

        def skip_htmls?
          htmls_for_action.empty? || assigns[:skip_htmls] == true
        end

        def skip_float_actions?
          float_actions_for_action.empty? || assigns[:skip_float_actions] == true
        end

        def body_classes
          Arbre::HTML::ClassList.new [
            params[:action],
            params[:controller].tr("/", "_"),
            "active_admin", "logged_in",
            active_admin_namespace.name.to_s + "_namespace",
            body_css_classes,
            "layout-navigation-#{navigation_layouts}",
            sidebar_class
          ]
        end

        def sidebar_class
          skip_sidebar? ? "without_sidebar" : "with_sidebar"
        end

        def build_flash_messages
          return if flash_messages.blank?

          div class: "flashes" do
            flash_messages.each do |type, msg|
              div msg, class: "flash #{flash_css_classes[:default]} #{flash_css_classes[type.to_sym]}".strip
            end
          end
        end

        def content_wrapper_class
          klass =
            case self.class.to_s
            when "ActiveAdmin::Views::Pages::Index"
              content_css_classes[:index]
            when "ActiveAdmin::Views::Pages::Form"
              content_css_classes[:form]
            when "ActiveAdmin::Views::Pages::Show"
              content_css_classes[:show]
            end
          klass || "container"
        end
      end
    end
  end
end
