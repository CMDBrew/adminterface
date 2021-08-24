module ActiveAdminBootstrap
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Installs ActiveAdminBoostrap and generates necessary migrations"

      def install_rails_addons
        invoke "action_text:install"
      end

      def install_assets
        install_webpacker? do
          generate "active_admin_bootstrap:webpacker"
        end
      end

      def install_action_text_for_comments
        generate "active_admin_bootstrap:comments"
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
