module ActiveAdmin
  # Overwrite DynamicSettingsNode - lib/active_admin/dynamic_settings_node.rb
  class DynamicSettingsNode < SettingsNode
    class << self
      def add_writer(name, type)
        define_singleton_method("#{name}=") do |value|
          send("#{name}_setting=", DynamicSetting.build(merge_defaults(value, name), type))
        end
      end

      private

      def merge_defaults(value, name)
        return value unless ActiveAdminBootstrap::CONFIGS.key?(name)

        ActiveAdminBootstrap::CONFIGS[name].deep_merge(value)
      end
    end
  end
end
