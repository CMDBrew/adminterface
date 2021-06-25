module ActiveAdminBootstrap
  module Extensions
    module Formtastic
      module Inputs
        module CheckBoxesInput
          def choice_html(choice)
            template.content_tag(:div, class: "form-check") do
              template.content_tag(
                :label, choice_label(choice),
                label_html_options.merge(for: choice_input_dom_id(choice))
              )
            end
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
end

# Overwrite formtastic/lib/formtastic/inputs/check_boxes_input.rb
Formtastic::Inputs::CheckBoxesInput.class_eval do
  prepend ActiveAdminBootstrap::Extensions::Formtastic::Inputs::CheckBoxesInput
end
