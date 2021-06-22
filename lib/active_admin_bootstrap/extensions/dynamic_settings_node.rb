module ActiveAdminBootstrap
  module Extensions
    module DynamicSettingsNode
      def add_writer(name, type)
        define_singleton_method("#{name}=") do |value|
          send("#{name}_setting=", ActiveAdmin::DynamicSetting.build(merge_defaults(value, name), type))
        end
      end

      private

      def merge_defaults(value, name)
        return value unless ActiveAdminBootstrap::Configs::DEFAULTS.key?(name)

        ActiveAdminBootstrap::Configs::DEFAULTS[name].deep_merge(value)
      end
    end
  end
end

# Overwrite lib/active_admin/dynamic_settings_node.rb
ActiveAdmin::DynamicSettingsNode.class_eval do
  class << self
    prepend ActiveAdminBootstrap::Extensions::DynamicSettingsNode
  end
end
