require "activeadmin"

# ActiveAdminBootstrap main file
module ActiveAdminBootstrap
  autoload :VERSION, "active_admin_bootstrap/version"
  autoload :CONFIGS, "active_admin_bootstrap/configs"

  # Load Initializers
  module Initializers
    autoload :Configurations, "active_admin_bootstrap/initializers/configurations"
  end
end

require "active_admin_bootstrap/engine"
