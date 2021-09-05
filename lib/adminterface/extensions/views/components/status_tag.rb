module Adminterface
  module Extensions
    module Views
      module Components
        module StatusTag
          protected

          def status_to_class(status)
            case status
            when "Unset", nil then status_tag_css_classes[:unset]
            when "Yes" then status_tag_css_classes[:yes]
            when "No" then status_tag_css_classes[:no]
            else status.to_s.titleize.gsub(/\s/, "").underscore
            end
          end
        end
      end
    end
  end
end

# Overwrite activeadmin/lib/active_admin/views/components/status_tag.rb
ActiveAdmin::Views::StatusTag.class_eval do
  prepend Adminterface::Extensions::Views::Components::StatusTag
  has_css_classes_for :status_tag
end
