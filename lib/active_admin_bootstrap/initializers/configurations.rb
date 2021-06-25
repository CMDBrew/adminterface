module ActiveAdminBootstrap
  module Initializers
    module Configurations
      extend ActiveSupport::Concern

      included do
        config.before_configuration do |_app|
          require_relative("../extensions/dynamic_settings_node")
          require_relative("../extensions/namespace_settings")

          ActiveAdmin::Views::FormtasticProxy.send :include, ActiveAdminBootstrap::Configs::Finders
          ActiveAdmin::Views::TableFor.send :include, ActiveAdminBootstrap::Configs::Finders
          ActiveAdmin::Views::Pages::Base.send :include, ActiveAdminBootstrap::Configs::Finders
          ActiveAdmin::FormBuilder.send :include, ActiveAdminBootstrap::Configs::Finders
          ActiveAdmin::HasManyBuilder.send :include, ActiveAdminBootstrap::Configs::Finders
          ActiveAdmin::Component.send :include, ActiveAdminBootstrap::Configs::Finders
          ActiveAdmin::ViewHelpers.send :include, ActiveAdminBootstrap::Configs::Finders

          ActiveAdmin::Resource.send :include, ActiveAdminBootstrap::Configs::Configurable
          ActiveAdmin::Page.send :include, ActiveAdminBootstrap::Configs::Configurable
        end
      end
    end
  end
end
