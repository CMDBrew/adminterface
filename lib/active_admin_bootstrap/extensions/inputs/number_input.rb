module ActiveAdminBootstrap
  module Extensions
    module Inputs
      module NumberInput
        include Base
      end
    end
  end
end

module ActiveAdmin
  module Inputs
    class NumberInput < ::Formtastic::Inputs::NumberInput
      include ::ActiveAdminBootstrap::Extensions::Inputs::NumberInput
    end
  end
end
