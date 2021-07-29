module ActiveAdminBootstrap
  module Extensions
    module Inputs
      module Base
        module ActiveAdminConfig
          include ActiveAdminBootstrap::Configs::Finders

          def active_admin_config
            template.active_admin_config
          rescue => _e
            ::ActiveAdmin.application
          end

          def inputs_config
            active_admin_config.components.dig(:inputs)
          end
        end
      end
    end
  end
end
