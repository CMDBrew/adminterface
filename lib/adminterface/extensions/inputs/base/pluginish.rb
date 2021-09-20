module Adminterface
  module Extensions
    module Inputs
      module Base
        module Pluginish
          class Config
            attr_reader :name, :configs, :options

            def initialize(configs, options)
              @name = configs[:name]
              @configs = configs
              @options = options[@name.underscore.to_sym]
            end

            def attributes
              return {} unless enabled?

              {"aa-#{name}": options.is_a?(Hash) ? options : defaults}
            end

            def defaults
              @defaults ||= configs[:options] || {}
            end

            def enabled?
              (!options.eql?(false) && configs[:default].eql?(true)) ||
                (options.present? || options.eql?(true))
            end
          end

          def plugins_configs
            plugins&.map { |plugin| Config.new(plugin, options).attributes } || []
          end

          def plugins_options
            {data: plugins_configs.inject(&:merge)}
          end

          def plugin?(name)
            !!plugins_options.dig(:data, "aa-#{name}".to_sym)
          end

          private

          def plugins
            inputs_config.dig(plugins_configs_key, :js)
          end

          def plugins_configs_key
            self.class.name.underscore.split("/").last.gsub("_input", "").to_sym
          end
        end
      end
    end
  end
end
