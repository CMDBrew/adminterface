module Adminterface
  module Extensions
    module Inputs
      module CheckBoxesInput
        include Base
        include Base::Choices

        def choice_html(choice)
          checkbox_input(choice) +
            template.content_tag(
              :label, choice_label(choice),
              label_html_options.merge(for: choice_input_dom_id(choice))
            )
        end

        def input_html_options
          super.merge(class: "form-check-input")
        end

        def label_html_options
          super.merge(class: "form-check-label")
        end
      end
    end
  end
end

module ActiveAdmin
  module Inputs
    class CheckBoxesInput < ::Formtastic::Inputs::CheckBoxesInput
      include ::Adminterface::Extensions::Inputs::CheckBoxesInput
    end
  end
end
