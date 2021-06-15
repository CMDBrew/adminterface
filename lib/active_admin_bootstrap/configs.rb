module ActiveAdminBootstrap
  module Configs
    DEFAULTS = lambda {
      path = "lib/active_admin_bootstrap/fixtures"

      HashWithIndifferentAccess.new(
        breakpoints: YAML.load_file(Engine.root.join("#{path}/breakpoints.yml").to_s),
        components: YAML.load_file(Engine.root.join("#{path}/components.yml").to_s),
        css_classes: YAML.load_file(Engine.root.join("#{path}/css_classes.yml").to_s),
        icons: YAML.load_file(Engine.root.join("#{path}/icons.yml").to_s),
        layouts: YAML.load_file(Engine.root.join("#{path}/layouts.yml").to_s)
      )
    }.call.freeze

    module Finders
      extend ActiveSupport::Concern
      class FinderError < StandardError; end

      class_methods do
        def has_css_classes_for(*args)
          args.each { |key| define_configs_getter(:css_classes, key) }
        end

        def has_breakpoints_for(*args)
          args.each { |key| define_configs_getter(:breakpoints, key) }
        end

        def has_layouts_for(*args)
          args.each { |key| define_configs_getter(:layouts, key) }
        end

        def has_icons_for(*args)
          args.each { |key| define_configs_getter(:icons, key) }
        end

        def define_configs_getter(type, key)
          name = "#{key}_#{type}"
          define_method name do
            return instance_variable_get("@#{name}") if instance_variable_defined?("@#{name}")
            instance_variable_set "@#{name}", find_configs(type, key)
          end
        end
      end

      private

      def find_configs(key, *args)
        active_admin_config.send(key).dig(*args)
      rescue TypeError => _e
        raise FinderError, "Invalid #{key}: #{args.join(" -> ")}"
      rescue => e
        Rails.logger.info "#{e.class}: active_admin_config is not available for #{self.class}"
        ActiveAdmin.application.try(key).dig(*args)
      end
    end
  end
end
