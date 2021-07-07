module ActiveAdminBootstrap
  module Extensions
    module Inputs
      module NumberInput
        include Base
        include Base::Stringish
        prepend Base::Groupish

        def input_html
          builder.number_field(method, input_html_options)
        end
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
