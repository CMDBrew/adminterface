module ActiveAdminBootstrap
  module Extensions
    module Inputs
      module Base
        module Wrapping
          def wrapper_classes
            "#{super} mb-3"
          end
        end
      end
    end
  end
end
