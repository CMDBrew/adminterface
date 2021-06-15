require "activeadmin"

# ActiveAdminBootstrap main file
module ActiveAdminBootstrap
  autoload :VERSION, "active_admin_bootstrap/version"
  autoload :Configs, "active_admin_bootstrap/configs"

  # Load Initializers
  module Initializers
    autoload :Configurations, "active_admin_bootstrap/initializers/configurations"
    autoload :Resource, "active_admin_bootstrap/initializers/resource"
    autoload :Views, "active_admin_bootstrap/initializers/views"
  end
end

require "active_admin_bootstrap/engine"
