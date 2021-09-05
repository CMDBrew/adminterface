module Adminterface
  module Extensions
    module DynamicSettingsNode
      def add_writer(name, type)
        define_singleton_method("#{name}=") do |value|
          send("#{name}_setting=", ActiveAdmin::DynamicSetting.build(merge_defaults(value, name), type))
        end
      end

      private

      def merge_defaults(value, name)
        return value unless Adminterface::Configs::DEFAULTS.key?(name)

        Adminterface::Configs::DEFAULTS[name].deep_merge(value)
      end
    end
  end
end

# Overwrite activeadmin/lib/active_admin/dynamic_settings_node.rb
ActiveAdmin::DynamicSettingsNode.class_eval do
  class << self
    prepend Adminterface::Extensions::DynamicSettingsNode
  end
end
