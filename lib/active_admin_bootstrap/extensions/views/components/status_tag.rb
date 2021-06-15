module ActiveAdmin
  module Views
    # Overwrite activeadmin/lib/active_admin/views/components/status_tag.rb
    class StatusTag < ActiveAdmin::Component
      include ::ActiveAdminBootstrap::Configs::Finders

      has_css_classes_for :status_tag

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
