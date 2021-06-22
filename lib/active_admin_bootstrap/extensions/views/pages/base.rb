module ActiveAdminBootstrap
  module Extensions
    module Views
      module Pages
        module Base
          SIDEBAR_OPTS = %w[left right].freeze

          def build(*args)
            unless SIDEBAR_OPTS.include?(sidebar_layouts)
              raise "Invalid layout option for sidebar. Available options are: #{SIDEBAR_OPTS.join(", ")}"
            end

            super
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
              end
            end
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

          def body_classes
            super.add "#{html_css_classes[:body]} layout-navigation-#{navigation_layouts} #{sidebar_class}".squish
          end

          def sidebar_class
            skip_sidebar? ? "without_sidebar" : "with_sidebar"
          end

          def build_flash_messages
            return if flash_messages.blank?

            div class: "flashes" do
              flash_messages.each do |type, messages|
                [*messages].each do |message|
                  div message, class: "flash flash_#{type} #{flash_css_classes[:default]} #{flash_css_classes[type.to_sym]}".squish
                end
              end
            end
          end

          def content_wrapper_class
            klass =
              case self.class.to_s
              when "ActiveAdmin::Views::Pages::Index"
                html_css_classes.dig(:container, :index)
              when "ActiveAdmin::Views::Pages::Form"
                html_css_classes.dig(:container, :form)
              when "ActiveAdmin::Views::Pages::Show"
                html_css_classes.dig(:container, :show)
              end
            klass || "container"
          end
        end
      end
    end
  end
end

# Overwrite lib/active_admin/views/pages/base.rb
ActiveAdmin::Views::Pages::Base.class_eval do
  prepend ActiveAdminBootstrap::Extensions::Views::Pages::Base
  has_css_classes_for :html, :flash
  has_layouts_for :sidebar, :navigation
end
