module ActiveAdminBootstrap
  module Generators
    class WebpackerGenerator < Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)

      def install_packages
        insert_into_file "config/webpack/environment.js", after: /require\(('|")@rails\/webpacker\1\);?\n/ do
          <<~EOF

            environment.loaders.get('sass').use.splice(-1, 0, {
              loader: 'resolve-url-loader'
            })
          EOF
        end

        if File.exist?(Rails.root.join(".npmrc"))
          append_to_file ".npmrc" do
            <<~EOF
              @cmdbrew:registry=https://npm.pkg.github.com
            EOF
          end
        else
          create_file ".npmrc" do
            <<~EOF
              @cmdbrew:registry=https://npm.pkg.github.com
            EOF
          end
        end

        run "yarn add @cmdbrew/active_admin_bootstrap@v#{ActiveAdminBootstrap::VERSION}"
      end

      def install_assets
        template "active_admin.js", "app/javascript/packs/active_admin.js"
        template "active_admin.scss", "app/javascript/stylesheets/active_admin.scss"
      end

      def update_active_admin_configs
        gsub_file "config/initializers/active_admin.rb", "# config.use_webpacker = true", "config.use_webpacker = true"
      end

      def remove_activeadmin_dependencies
        run "yarn remove @activeadmin/activeadmin"

        remove_file "app/javascript/packs/active_admin/print.scss"
        remove_file "config/webpack/plugins/jquery.js"

        gsub_file "config/webpack/environment.js", "environment.plugins.prepend('jquery', jquery)\n", ""
        gsub_file "config/webpack/environment.js", "const jquery = require('./plugins/jquery')\n", ""
      end

      def show_readme
        readme "README" if behavior == :invoke
      end
    end
  end
end
