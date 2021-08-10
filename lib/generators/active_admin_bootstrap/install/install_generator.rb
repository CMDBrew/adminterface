module ActiveAdminBootstrap
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Installs ActiveAdminBoostrap and generates the necessary migrations"

      def create_assets
        generate "active_admin_bootstrap:webpacker"
      end
    end
  end
end
