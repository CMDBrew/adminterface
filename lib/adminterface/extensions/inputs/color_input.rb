module Adminterface
  module Extensions
    module Inputs
      module ColorInput
        include Base
        include Base::Stringish
        prepend Base::Groupish

        def input_html
          builder.color_field(method, input_html_options)
        end

        def input_html_options
          opts = super
          opts[:class] = "#{opts[:class]} form-control-color".squish
          opts
        end
      end
    end
  end
end

module ActiveAdmin
  module Inputs
    class ColorInput < ::Formtastic::Inputs::ColorInput
      include ::Adminterface::Extensions::Inputs::ColorInput
    end
  end
end
