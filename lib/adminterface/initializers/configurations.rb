module Adminterface
  module Initializers
    module Configurations
      extend ActiveSupport::Concern

      included do
        config.before_configuration do |_app|
          require_relative("../extensions/dynamic_settings_node")
          require_relative("../extensions/namespace_settings")

          # Include the configs finder for not registered class/module files
          ActiveAdmin::Views::FormtasticProxy.send :include, Adminterface::Configs::Finders
          ActiveAdmin::Component.send :include, Adminterface::Configs::Finders
          ActiveAdmin::ViewHelpers.send :include, Adminterface::Configs::Finders
          ActiveAdmin::Resource.send :include, Adminterface::Configs::Configurable
          ActiveAdmin::Page.send :include, Adminterface::Configs::Configurable
        end
      end
    end
  end
end
