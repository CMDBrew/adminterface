module Adminterface
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Installs Adminterface and generates necessary files and migrations"
      source_root File.expand_path("templates", __dir__)

      class_option :skip_action_text,
        type: :boolean, default: false,
        desc: "Skip installation of ActionText for comments"
      class_option :skip_examples,
        type: :boolean, default: false,
        desc: "Skip adding sample admin files"
      class_option :webpacker,
        type: :boolean, default: true,
        desc: "Install assets with webpacker"
      class_option :version,
        aliases: "-v", type: :string, default: Adminterface::VERSION,
        desc: "Install with a specific version"

      def install_assets
        return unless options[:webpacker]

        generate "adminterface:webpacker -v #{options[:version]}"
      end

      def install_action_text_for_comments
        return if options[:skip_action_text]

        generate "adminterface:comments"
      end

      def add_examples
        return if options[:skip_examples]

        template "dashboard.rb", "app/admin/dashboard.rb"
      end
    end
  end
end
