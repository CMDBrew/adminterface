module ActiveAdminBootstrap
  module Extensions
    module Inputs
      module PasswordInput
        module Visibility
          def label_html
            return super unless visibility?

            template.content_tag(:div, class: "label-group") do
              [super, visibility_toggler].join.html_safe
            end
          end

          private

          def visibility_toggler
            template.content_tag(:div, class: "password-visibility-toggler", data: {"aa-password-visibility-toggler": true}) do
              template.content_tag(:span, visibility_toggler_text(:show), data: {mode: "show"}) +
                template.content_tag(:span, visibility_toggler_text(:hide), data: {mode: "hide"})
            end
          end

          def visibility_toggler_text(status)
            I18n.t(status, scope: "active_admin.inputs.password.visibility")
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
      include ::ActiveAdminBootstrap::Extensions::Inputs::PasswordInput
    end
  end
end
