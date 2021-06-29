module ActiveAdminBootstrap
  module Extensions
    module Inputs
      module TextInput
        include Base
      end
    end
  end
end

module ActiveAdmin
  module Inputs
    class TextInput < ::Formtastic::Inputs::TextInput
      include ::ActiveAdminBootstrap::Extensions::Inputs::Base::Floatish
      include ::ActiveAdminBootstrap::Extensions::Inputs::TextInput

      def to_floating_html
        input_wrapping do
          builder.text_area(method, input_html_options) <<
            label_html
        end
      end
    end
  end
end
