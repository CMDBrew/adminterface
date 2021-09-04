module Adminterface
  module Generators
    class ConfigsGenerator < Rails::Generators::Base
      desc "Copies config files into a directory for customization"
      argument :namespace, type: :string, default: "Admin"

      source_root File.expand_path("templates", __dir__)

      def copy
        directory Adminterface::Engine.root.join("lib/adminterface/fixtures"),
          "config/adminterface/#{namespace.underscore}/"
      end

      def show_readme
        readme "README" if behavior == :invoke
      end
    end
  end
end
