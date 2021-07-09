module ActiveAdminBootstrap
  module Extensions
    module Inputs
      module Base
        module Wrapping
          def input_wrapping(&block)
            html = input_wrapping_html(&block)
            template.concat(html) if template.output_buffer && template.assigns[:has_many_block]
            html
          end

          def input_wrapping_html(&block)
            template.content_tag(:div,
              [template.capture(&block), error_html, hint_html].join("\n").html_safe,
              wrapper_html_options)
          end

          def wrapper_classes
            "#{super} mb-3"
          end
        end
      end
    end
  end
end
