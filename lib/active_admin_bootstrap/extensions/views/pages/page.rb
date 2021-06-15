module ActiveAdmin
  module Views
    module Pages
      # Overwrite activeadmin/lib/active_admin/views/pages/page.rb
      class Page < Base
        def body_classes
          Arbre::HTML::ClassList.new [
            params[:action],
            params[:controller].tr("/", "_"),
            "active_admin", "logged_in", "page",
            active_admin_namespace.name.to_s + "_namespace",
            active_admin_config.body_class,
            "layout-navigation-#{active_admin_config.navigation}"
          ]
        end
      end
    end
  end
end
