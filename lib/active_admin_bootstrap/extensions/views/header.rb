module ActiveAdminBootstrap
  module Extensions
    module Views
      module Header
        ID = "header-nav".freeze

        def tag_name
          :nav
        end

        private

        def build_navigations
          add_class "navbar #{header_css_classes[:wrapper]}".squish
          site_title @namespace
          navbar_toggler
          navbar_nav
        end

        def navbar_nav
          div id: ID, class: "collapse navbar-collapse" do
            global_navigation @menu, id: "main-nav", class: "navbar-nav"
            utility_navigation @utility_menu, id: "utility-nav", class: "navbar-nav"
          end
        end

        def navbar_toggler
          button(class: "navbar-toggler", 'data-target': "##{ID}", 'data-toggle': "collapse") do
            span class: "navbar-toggler-icon"
          end
        end
      end
    end
  end
end

# Overwrite lib/active_admin/views/header.rb
ActiveAdmin::Views::Header.class_eval do
  prepend ActiveAdminBootstrap::Extensions::Views::Header
  has_css_classes_for :header

  def build(namespace, menu)
    super(id: "header")

    @namespace = namespace
    @menu = menu
    @utility_menu = @namespace.fetch_menu(:utility_navigation)

    div class: header_css_classes[:container] do
      build_navigations
    end
  end
end
