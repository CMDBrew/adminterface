module ActiveAdminBootstrap
  module Extensions
    module Formtastic
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
end

# Overwrite formtastic/lib/formtastic/inputs/base/wrapping.rb
Formtastic::Inputs::Base::Wrapping.module_eval do
  prepend ActiveAdminBootstrap::Extensions::Formtastic::Inputs::Base::Wrapping
end
