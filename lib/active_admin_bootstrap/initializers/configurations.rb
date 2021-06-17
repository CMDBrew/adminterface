module ActiveAdminBootstrap
  module Initializers
    module Configurations
      extend ActiveSupport::Concern

      included do
        config.before_configuration do |_app|
          require_relative("../extensions/dynamic_settings_node")
          require_relative("../extensions/namespace_settings")

          ActiveAdmin::Resource.send :include, ::ActiveAdminBootstrap::Configs::Configurable
          ActiveAdmin::Page.send :include, ::ActiveAdminBootstrap::Configs::Configurable
        end
      end
    end
  end
end
