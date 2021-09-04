module Adminterface
  module Extensions
    module Inputs
      module Base
        module Stringish
          def to_html
            input_wrapping do
              label_html << input_html
            end
          end

          def input_html
            builder.text_field(method, input_html_options)
          end
        end
      end
    end
  end
end
