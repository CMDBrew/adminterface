require "activeadmin"

# ActiveAdminBootstrap main file
module ActiveAdminBootstrap
  autoload :VERSION, "active_admin_bootstrap/version"
  autoload :Configs, "active_admin_bootstrap/configs"

  # Load Initializers
  module Initializers
    autoload :BatchActions, "active_admin_bootstrap/initializers/batch_actions"
    autoload :Configurations, "active_admin_bootstrap/initializers/configurations"
    autoload :Formtastic, "active_admin_bootstrap/initializers/formtastic"
    autoload :Resource, "active_admin_bootstrap/initializers/resource"
    autoload :ViewHelpers, "active_admin_bootstrap/initializers/view_helpers"
    autoload :Views, "active_admin_bootstrap/initializers/views"
  end
end

require "active_admin_bootstrap/engine"
