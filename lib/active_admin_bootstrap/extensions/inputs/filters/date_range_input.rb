module ActiveAdminBootstrap
  module Extensions
    module Inputs
      module Filters
        module DateRangeInput
          def to_html
            input_wrapping do
              [
                label_html,
                fields
              ].join("\n")&.html_safe
            end
          end

          def fields
            template.content_tag :div, class: "row g-3" do
              template.content_tag(:div, gt_input, class: "col") +
                template.content_tag(:div, lt_input, class: "col")
            end
          end

          def input_html_options_for(input_name, placeholder)
            super.merge(class: "form-control", data: {"aa-datepicker": {enableTime: false, altFormat: "Y-m-d"}})
          end

          private

          def gt_input
            builder.text_field(gt_input_name, input_html_options_for(gt_input_name, gt_input_placeholder))
          end

          def lt_input
            builder.text_field(lt_input_name, input_html_options_for(lt_input_name, lt_input_placeholder))
          end
        end
      end
    end
  end
end

# Overwrite activeadmin/lib/active_admin/inputs/filters/date_range_input.rb
ActiveAdmin::Inputs::Filters::DateRangeInput.class_eval do
  prepend ActiveAdminBootstrap::Extensions::Inputs::Filters::DateRangeInput
end
