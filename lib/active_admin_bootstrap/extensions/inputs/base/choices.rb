module ActiveAdminBootstrap
  module Extensions
    module Inputs
      module Base
        module Choices
          def choice_wrapping_html_options(choice)
            choice_options = super(choice)
            choice_options[:class] = "#{choice_options[:class]} #{choice_wrapping_class}".squish
            choice_options
          end

          def legend_html
            if render_label?
              template.content_tag(:label, label_text, label_html_options.merge(class: "form-label"))
            else
              "".html_safe
            end
          end

          private

          def choice_wrapping_class
            "form-check #{inline? ? "form-check-inline" : nil}".squish
          end

          def inline?
            options[:inline].eql?(true)
          end
        end
      end
    end
  end
end
