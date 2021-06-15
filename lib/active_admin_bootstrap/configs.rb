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
          args.each do |key|
            var_name = "#{key}_css_classes"
            define_method var_name do
              return instance_variable_get("@#{var_name}") if instance_variable_defined?("@#{var_name}")
              instance_variable_set "@#{var_name}", find_css_classes(key)
            end
          end
        end
      end

      def find_layouts(*args)
        find_configs(:layouts, *args)
      end

      def find_breakpoints(*args)
        find_configs(:breakpoints, *args)
      end

      def find_css_classes(*args)
        find_configs(:css_classes, *args)
      end

      def find_icons(*args)
        find_configs(:icons, *args)
      end

      private

      def find_configs(key, *args)
        active_admin_config.send(key).dig(*args).to_s
      rescue TypeError => _e
        raise FinderError, "Invalid #{key}: #{args.join(" -> ")}"
      rescue => e
        Rails.logger.info "#{e.class}: active_admin_config is not available for #{self.class}"
        ActiveAdmin.application.try(key).dig(*args)
      end
    end
  end
end
