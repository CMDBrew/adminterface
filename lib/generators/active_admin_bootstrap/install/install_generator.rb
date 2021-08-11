module ActiveAdminBootstrap
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Installs ActiveAdminBoostrap and generates the necessary migrations"

      def install_assets
        install_webpacker? do
          generate "active_admin_bootstrap:webpacker"
        end
      end

      private

      def install_webpacker?
        return yield if defined?(Webpacker)

        puts Rainbow("ActiveAdminBootstrap requires webpacker:").yellow
        if yes?("Install webpacker and continue?")
          gem "webpacker"
          rails_command "webpacker:install"
          yield
        else
          puts Rainbow("Installation aborted").red
        end
      end
    end
  end
end
