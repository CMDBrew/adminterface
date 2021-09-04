module Adminterface
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Installs Adminterface and generates necessary files and migrations"

      def install_rails_addons
        invoke "action_text:install"
      end

      def install_assets
        install_webpacker? do
          generate "adminterface:webpacker"
        end
      end

      def install_action_text_for_comments
        generate "adminterface:comments"
      end

      private

      def install_webpacker?
        return yield if defined?(Webpacker)

        puts Rainbow("Adminterface requires webpacker:").yellow
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
