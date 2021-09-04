module Adminterface
  module Extensions
    module Inputs
      module TextInput
        include Base

        def to_html
          input_wrapping do
            label_html << input_html
          end
        end

        def input_html
          counter_html do
            builder.text_area(method, input_html_options)
          end
        end

        def counter_html
          return yield unless input_counter?

          template.content_tag(:div, class: "input-counter-container") do
            yield <<
              template.content_tag(:ul, class: "input-counter-stats") do
                template.content_tag(:li, "", class: "input-counter-char-count") <<
                  template.content_tag(:li, "", class: "input-counter-char-left") <<
                  template.content_tag(:li, "", class: "input-counter-char-limit")
              end
          end
        end

        def input_html_options
          super.merge(input_counter_options)
        end

        def input_counter_options
          return {} unless input_counter?

          {data: {"aa-input-counter": input_counter}}
        end

        private

        def input_counter
          return unless options[:counter]

          opts = options[:counter].eql?(true) ? {} : options[:counter]
          inputs_config.dig(:text, :counter).merge(opts)
        end

        def input_counter?
          input_counter.present?
        end
      end
    end
  end
end

module ActiveAdmin
  module Inputs
    class TextInput < ::Formtastic::Inputs::TextInput
      include ::Adminterface::Extensions::Inputs::TextInput
    end
  end
end
