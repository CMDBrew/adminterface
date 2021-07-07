module ActiveAdminBootstrap
  module Extensions
    module Inputs
      module Base
        module Groupish
          def input_html
            return super unless grouping?

            template.content_tag :div, class: "input-group" do
              html = []
              html.push prepend_html if prepend_html?
              html.push super
              html.push append_html if append_html?
              html.join.html_safe
            end
          end

          def wrapper_html_options
            return super unless grouping?

            new_class = [super[:class], "input-group"].compact.join(" ")
            super.merge(class: new_class)
          end

          private

          def prepend_html
            options[:prepend]
          end

          def append_html
            options[:append]
          end

          def grouping?
            append_html? || prepend_html?
          end

          def prepend_html?
            prepend_html.present?
          end

          def append_html?
            append_html.present?
          end
        end
      end
    end
  end
end
