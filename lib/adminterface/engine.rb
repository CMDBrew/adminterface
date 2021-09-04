module Adminterface
  # Initialize Engine
  class Engine < ::Rails::Engine
    isolate_namespace Adminterface

    # Initializers: The load order matters
    include ::Adminterface::Initializers::BatchActions
    include ::Adminterface::Initializers::Configurations
    include ::Adminterface::Initializers::Formtastic
    include ::Adminterface::Initializers::Resource
    include ::Adminterface::Initializers::ViewHelpers
    include ::Adminterface::Initializers::Views
    include ::Adminterface::Initializers::Comments

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
