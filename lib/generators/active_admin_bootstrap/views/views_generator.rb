module ActiveAdminBootstrap
  module Generators
    class ViewsGenerator < Rails::Generators::Base
      desc "Copies views to the client app"

      source_root ActiveAdminBootstrap::Engine.root.join("app/views")

      def copy
        directory "active_admin", "app/views/active_admin"
        directory "kaminari/active_admin", "app/views/kaminari/active_admin"
        directory "layouts/active_admin_logged_out.html.erb", "app/views/layouts/active_admin_logged_out.html.erb"
      end
    end
  end
end
