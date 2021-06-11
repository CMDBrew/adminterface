module ActiveAdminBootstrap
  # Initialize Engine
  class Engine < ::Rails::Engine
    isolate_namespace ActiveAdminBootstrap

    # Initializers
    include ::ActiveAdminBootstrap::Initializers::Configurations

    # Override ActiveAdmin defaults
    config.before_initialize do
      ActiveAdmin.setup do |config|
        config.current_filters = false
        config.comments_menu = false
        config.comments_order = "created_at DESC"
        config.meta_tags = {
          viewport: "width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"
        }
      end
    end
  end
end
