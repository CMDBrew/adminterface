module Adminterface
  module Initializers
    module Configurations
      extend ActiveSupport::Concern

      included do
        config.before_configuration do |_app|
          require_relative("../extensions/dynamic_settings_node")
          require_relative("../extensions/namespace_settings")

          # Include the configs finder for not registered class/module files
          ActiveAdmin::Views::FormtasticProxy.send :include, Adminterface::Configs::Finders
          ActiveAdmin::Component.send :include, Adminterface::Configs::Finders
          ActiveAdmin::ViewHelpers.send :include, Adminterface::Configs::Finders
          ActiveAdmin::Resource.send :include, Adminterface::Configs::Configurable
          ActiveAdmin::Page.send :include, Adminterface::Configs::Configurable
        end

        # Override ActiveAdmin defaults
        config.before_initialize do
          ActiveAdmin.setup do |config|
            config.current_filters = false
            config.comments_menu = false
            config.comments_order = "created_at DESC"

            meta_tags = {
              version: Adminterface::VERSION,
              viewport: "width=device-width, height=device-height, initial-scale=1.0"
            }

            config.meta_tags_for_logged_out_pages = meta_tags
            config.meta_tags = meta_tags
          end
        end
      end
    end
  end
end
