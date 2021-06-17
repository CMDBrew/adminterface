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

    module Configurable
      attr_writer :layouts, :icons, :components, :css_classes, :breakpoints

      def layouts
        namespace.layouts.deep_merge(@layouts || {})
      end

      def icons
        namespace.icons.deep_merge(@icons || {})
      end

      def components
        namespace.components.deep_merge(@components || {})
      end

      def css_classes
        namespace.css_classes.deep_merge(@css_classes || {})
      end

      def breakpoints
        namespace.breakpoints.deep_merge(@breakpoints || {})
      end
    end

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
        configs.try(key)&.dig(*args)
      end

      def configs
        active_admin_config
      rescue => e
        Rails.logger.info "#{e.class}: active_admin_config is not available for #{self.class}"
        ActiveAdmin.application
      end
    end
  end
end
