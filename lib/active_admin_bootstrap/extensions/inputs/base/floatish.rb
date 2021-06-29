module ActiveAdminBootstrap
  module Extensions
    module Inputs
      module Base
        # For Bootstrap floating label input
        module Floatish
          def to_html
            floating? ? to_floating_html : super
          end

          def to_floating_html
            input_wrapping do
              builder.text_field(method, input_html_options) <<
                label_html
            end
          end

          def wrapper_html_options
            return super unless floating?

            new_class = [super[:class], "form-floating"].compact.join(" ")
            super.merge(class: new_class)
          end

          def input_html_options
            opts = super
            return opts if !floating? || opts[:placeholder].present?

            opts.merge(placeholder: label_text)
          end

          private

          def floating?
            options[:floating].eql?(true)
          end
        end
      end
    end
  end
end
