module Adminterface
  module Extensions
    module Inputs
      module PasswordInput
        module Visibility
          private

          def visibility_toggler
            template.content_tag(:span, class: "input-group-text password-visibility-toggler", data: {"aa-password-visibility-toggler": true}) do
              template.content_tag(:i, "", title: visibility_toggler_text(:show), data: {mode: "show", "bs-toggle": "tooltip"}) +
                template.content_tag(:i, "", title: visibility_toggler_text(:hide), data: {mode: "hide", "bs-toggle": "tooltip"})
            end
          end

          def visibility_toggler_text(status)
            I18n.t(status, scope: "active_admin.inputs.password.visibility")
          end

          def append_html
            return options[:append] unless visibility?

            [visibility_toggler, options[:append]].reject(&:blank?).join
          end

          def visibility?
            options[:visibility]
          end
        end

        include Base
        include Base::Stringish
        prepend Base::Groupish
        prepend Visibility

        def input_html
          builder.password_field(method, input_html_options)
        end
      end
    end
  end
end

module ActiveAdmin
  module Inputs
    class PasswordInput < ::Formtastic::Inputs::PasswordInput
      include ::Adminterface::Extensions::Inputs::PasswordInput
    end
  end
end
