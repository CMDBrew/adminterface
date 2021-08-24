module ActiveAdminBootstrap
  module Generators
    class ConfigsGenerator < Rails::Generators::Base
      desc "Copies config files into a directory for customization"
      argument :namespace, type: :string, default: "Admin"

      source_root File.expand_path("templates", __dir__)

      def copy
        directory ActiveAdminBootstrap::Engine.root.join("lib/active_admin_bootstrap/fixtures"),
          "config/active_admin_bootstrap/#{namespace.underscore}/"
      end

      def show_readme
        readme "README" if behavior == :invoke
      end
    end
  end
end
