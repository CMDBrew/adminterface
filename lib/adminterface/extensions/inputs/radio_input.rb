module Adminterface
  module Extensions
    module Inputs
      module RadioInput
        include Base
        include Base::Choices

        def choice_html(choice)
          radio_html(choice) +
            template.content_tag(
              :label, choice_label(choice),
              label_html_options.merge(for: choice_input_dom_id(choice))
            )
        end

        def label_html_options
          super.merge(class: "form-check-label")
        end

        private

        def radio_html(choice)
          builder.radio_button(
            input_name,
            choice_value(choice),
            input_html_options.merge(choice_html_options(choice))
              .merge(required: false, class: "form-check-input")
          )
        end
      end
    end
  end
end

module ActiveAdmin
  module Inputs
    class RadioInput < ::Formtastic::Inputs::RadioInput
      include ::Adminterface::Extensions::Inputs::RadioInput
    end
  end
end
