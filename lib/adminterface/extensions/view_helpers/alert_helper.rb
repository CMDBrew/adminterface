module Adminterface
  module Extensions
    module ViewHelpers
      module AlertHelper
        def flashes_html
          flash.each do |type, msg|
            concat(content_tag(:div, msg,
              class: "flash flash_#{type} alert #{flash_css_classes[type.to_sym]}".squish,
              role: "alert"))
          end
          nil
        end

        def devise_error_messages!
          return "" unless devise_error_messages?

          safe_join [devise_error_html]
        end

        def devise_error_messages?
          !resource.errors.empty?
        end

        private

        def devise_error_html
          messages = resource.errors.full_messages.join(", ")
          content_tag :div, messages, class: "alert #{flash_css_classes[:error]}"
        end
      end
    end
  end
end

ActiveAdmin::ViewHelpers.module_eval do
  prepend Adminterface::Extensions::ViewHelpers::AlertHelper
  has_css_classes_for :flash
end
