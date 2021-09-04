module Adminterface
  module Extensions
    module Inputs
      module BooleanInput
        include Base

        def to_html
          input_wrapping do
            template.content_tag :div, class: boolean_wrapper_class do
              hidden_field_html +
                check_box_html +
                label_html
            end
          end
        end

        def input_html_options
          opts = options[:input_html] || {}
          super.merge(class: "form-check-input #{opts[:class]}".squish)
        end

        def label_html_options
          super.merge(class: "form-check-label")
        end

        private

        def boolean_wrapper_class
          "form-check"
        end
      end
    end
  end
end

module ActiveAdmin
  module Inputs
    class BooleanInput < ::Formtastic::Inputs::BooleanInput
      include Adminterface::Extensions::Inputs::BooleanInput
    end
  end
end
