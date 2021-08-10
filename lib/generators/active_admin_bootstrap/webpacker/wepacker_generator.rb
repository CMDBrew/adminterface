module ActiveAdminBootstrap
  module Generators
    class WebpackerGenerator < Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)

      def install_assets
        template "active_admin.js", "app/javascript/packs/active_admin.js"
        template "active_admin.scss", "app/javascript/stylesheets/active_admin.scss"

        run "yarn add @active_admin_bootstrap/active_admin_bootstrap"
      end
    end
  end
end
