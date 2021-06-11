module ActiveAdminBootstrap
  module Initializers
    module Configurations
      extend ActiveSupport::Concern

      included do
        config.before_configuration do |_app|
          require_relative("../extensions/dynamic_settings_node")
          require_relative("../extensions/namespace_settings")
          require_relative("../extensions/resource")
        end
      end
    end
  end
end
