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
  end
end
