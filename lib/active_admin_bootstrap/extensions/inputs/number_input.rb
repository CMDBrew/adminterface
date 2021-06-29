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
      include ::ActiveAdminBootstrap::Extensions::Inputs::Base::Floatish
      include ::ActiveAdminBootstrap::Extensions::Inputs::NumberInput

      def to_floating_html
        input_wrapping do
          builder.number_field(method, input_html_options) <<
            label_html
        end
      end
    end
  end
end
