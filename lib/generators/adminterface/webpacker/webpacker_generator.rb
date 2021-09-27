module Adminterface
  module Generators
    class WebpackerGenerator < Rails::Generators::Base
      desc "Install Stylesheets and JavaScripts using Webpacker"
      class_option :version,
        aliases: "-v", type: :string, default: Adminterface::VERSION,
        desc: "Install with a specific npm package version"

      source_root File.expand_path("templates", __dir__)

      def install_packages
        insert_into_file "config/webpack/environment.js", after: /require\(('|")@rails\/webpacker\1\);?\n/ do
          <<~EOF

            environment.loaders.get('sass').use.splice(-1, 0, {
              loader: 'resolve-url-loader'
            })
          EOF
        end

        run "yarn add @cmdbrew/adminterface@v#{find_npm_version}"
      end

      def install_assets
        template "active_admin.js", "app/javascript/packs/active_admin.js"
        template "active_admin.scss", "app/javascript/stylesheets/active_admin.scss"
        template "print.scss", "app/javascript/packs/active_admin/print.scss"
      end

      def update_active_admin_configs
        gsub_file "config/initializers/active_admin.rb", "# config.use_webpacker = true", "config.use_webpacker = true"
      end

      def remove_activeadmin_dependencies
        run "yarn remove @activeadmin/activeadmin"
        remove_file "config/webpack/plugins/jquery.js"
        gsub_file "config/webpack/environment.js", "environment.plugins.prepend('jquery', jquery)\n", ""
        gsub_file "config/webpack/environment.js", "const jquery = require('./plugins/jquery')\n", ""
      end

      def show_readme
        readme "README" if behavior == :invoke
      end

      private

      def find_npm_version
        version = options[:version]
        return version unless version.include?(".rc")

        version.gsub(".rc", "-rc")
      end
    end
  end
end
