module ActiveAdmin
  module Views
    module Pages
      # Overwrite activeadmin/lib/active_admin/views/pages/index.rb
      class Index < Base
        include ::ActiveAdminBootstrap::Configs::Finders

        has_css_classes_for :table_tools
        has_layouts_for :filter
        has_icons_for :filter

        def main_content
          unless FILTER_OPTS.include?(filter_layouts)
            raise "Invalid filter_position. Available options are: #{FILTER_OPTS.join(", ")}"
          end

          build_table_tools
          wrap_with_batch_action_form do
            build_collection
          end
        end

        def build_page
          super

          within body(class: body_classes) do
            build_aside
          end
        end

        def build_table_tools
          return unless any_table_tools?

          div class: "table_tools" do
            build_scopes
            build_filters
            div class: "scope_ctrls" do
              build_batch_actions_selector
              build_index_list
              build_filter_toggler
            end
          end
        end

        private

        def action_items_for_action
          if filter_layouts.eql?("aside")
            items = super << aside_filter_action
            items.sort_by { |x| [x.group, x.priority] }
          else
            super
          end
        end

        def aside_filter_action
          ActiveAdmin::ActionItem.new(:filter, only: :index, group: 90) do
            link_to aa_icon(filter_icons.dig(:aside, :open)), "#",
              id: "aside-filters-toggler",
              data: {toggle: "collapse", target: "#aside-filters"},
              title: I18n.t(:filters, scope: "active_admin.sidebars")
          end
        end

        def build_aside
          return if filter_sections.blank?
          return unless filter_layouts.eql?("aside")

          div id: "aside-filters", class: "collapse" do
            a aa_icon(filter_icons.dig(:aside, :close)),
              id: "aside-close", href: "#",
              'data-toggle': "collapse", 'data-target': "#aside-filters"
            filter_sections.collect { |x| sidebar_section(x) }
          end
        end

        def build_filters
          return if filter_sections.blank?
          return unless filter_layouts.eql?("table_tools")

          div id: "filter", class: "collapse" do
            filter_sections.collect { |x| sidebar_section(x) }
          end
        end

        def build_filter_toggler
          return if filter_sections.blank?
          return unless filter_layouts.eql?("table_tools")

          div id: "filter-toggler" do
            a span(I18n.t("active_admin.sidebars.filters")),
              href: "#", class: "filter_toggler #{table_tools_css_classes[:btn]}",
              'data-toggle': "collapse", 'data-target': "#filter"
          end
        end

        def filter_section?(section)
          section.name.to_sym == :filters
        end

        def filter_sections
          sections = []
          available_sidebar_sections.collect do |section|
            next unless filter_section?(section)

            sections.push section
          end
          sections
        end

        def skip_sidebar?
          sidebar_sections_for_action.empty? || assigns[:skip_sidebar] == true
        end

        def available_sidebar_sections
          if active_admin_config&.sidebar_sections?
            active_admin_config.sidebar_sections_for(params[:action], self)
          else
            []
          end
        end

        def sidebar_sections_for_action
          if filter_layouts.eql?("sidebar")
            available_sidebar_sections
          else
            available_sidebar_sections.reject { |x| x.name.to_sym == :filters }
          end
        end
      end
    end
  end
end
