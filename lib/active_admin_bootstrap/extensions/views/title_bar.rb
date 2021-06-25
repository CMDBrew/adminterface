module ActiveAdminBootstrap
  module Extensions
    module Views
      module TitleBar
        def tag_name
          :nav
        end

        private

        def build_titlebar_left
          div build_breadcrumb, id: "titlebar_left"
        end

        def build_header_toggler
          button class: "navbar-toggler header-toggler" do
            span class: "navbar-toggler-icon"
          end
        end

        def build_titlebar_right
          return if @action_items.blank?

          super
        end

        def links
          breadcrumb_config = active_admin_config&.breadcrumb
          if breadcrumb_config.is_a?(Proc)
            instance_exec(controller, &active_admin_config.breadcrumb)
          elsif breadcrumb_config.present?
            breadcrumb_links
          end
        end

        def build_breadcrumb(_separator = "/")
          ol id: "breadcrumb", class: "breadcrumb" do
            links.each do |link|
              li(text_node(link), class: "breadcrumb-item")
            end
            li(text_node(@title), class: "breadcrumb-item active")
          end
        end

        def build_action_items
          @action_items.group_by(&:group).each do |_index, items|
            insert_tag(view_factory.action_items, items)
          end
        end
      end
    end
  end
end

# Overwrite activeadmin/lib/active_admin/views/title_bar.rb
ActiveAdmin::Views::TitleBar.class_eval do
  prepend ActiveAdminBootstrap::Extensions::Views::TitleBar
  has_css_classes_for :title_bar

  def build(namespace, title, action_items)
    super(id: "title_bar")
    add_class "navbar #{title_bar_css_classes[:wrapper]}".squish
    @title = title
    @action_items = action_items
    @namespace = namespace

    div class: title_bar_css_classes[:container] do
      build_header_toggler
      site_title @namespace
      build_titlebar_left
      build_titlebar_right
    end
  end
end
