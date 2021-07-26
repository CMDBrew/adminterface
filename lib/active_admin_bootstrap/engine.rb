module ActiveAdminBootstrap
  # Initialize Engine
  class Engine < ::Rails::Engine
    isolate_namespace ActiveAdminBootstrap

    # Initializers
    include ::ActiveAdminBootstrap::Initializers::BatchActions
    include ::ActiveAdminBootstrap::Initializers::Configurations
    include ::ActiveAdminBootstrap::Initializers::Formtastic
    include ::ActiveAdminBootstrap::Initializers::Resource
    include ::ActiveAdminBootstrap::Initializers::ViewHelpers
    include ::ActiveAdminBootstrap::Initializers::Views

    # Override ActiveAdmin defaults
    config.before_initialize do
      ActiveAdmin.setup do |config|
        config.current_filters = false
        config.comments_menu = false
        config.comments_order = "created_at DESC"

        meta_tags = {viewport: "width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"}
        config.meta_tags_for_logged_out_pages = meta_tags
        config.meta_tags = meta_tags
      end
    end
  end
end
