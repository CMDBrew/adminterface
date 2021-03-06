module Adminterface
  module Extensions
    module Inputs
      module SelectInput
        include Base
        prepend Base::Groupish

        def to_html
          input_wrapping do
            label_html << input_html
          end
        end

        def input_html
          select_html
        end

        def input_html_options
          opts = options[:input_html] || {}
          super.merge(class: "form-select #{opts[:class]}".squish)
        end
      end
    end
  end
end

module ActiveAdmin
  module Inputs
    class SelectInput < ::Formtastic::Inputs::SelectInput
      include ::Adminterface::Extensions::Inputs::SelectInput
    end
  end
end
