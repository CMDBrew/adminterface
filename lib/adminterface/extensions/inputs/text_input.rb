module Adminterface
  module Extensions
    module Inputs
      module TextInput
        include Base

        def to_html
          input_wrapping do
            label_html << input_html
          end
        end

        def input_html
          builder.text_area(method, input_html_options)
        end
      end
    end
  end
end

module ActiveAdmin
  module Inputs
    class TextInput < ::Formtastic::Inputs::TextInput
      include ::Adminterface::Extensions::Inputs::TextInput
    end
  end
end
