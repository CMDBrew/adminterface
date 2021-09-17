module Adminterface
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
            opts = super
            opts[:class] = "#{opts[:class]} form-control".squish
            opts.merge(plugins_options)
          end

          private

          def plugins_configs_key
            :date_picker
          end

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
  prepend Adminterface::Extensions::Inputs::Filters::DateRangeInput
end
