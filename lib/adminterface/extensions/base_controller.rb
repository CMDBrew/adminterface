module Adminterface
  module Extensions
    module BaseController
      def default_url_options
        super.merge(tab: params[:tab], anchor: params[:anchor_id])
      end

      private

      def set_resource_scope
        session[:resource_scope] = {
          controller: controller_path,
          action: action_name_pairing(action_name)
        }
      end

      def action_name_pairing(name)
        case name
        when "create" then "new"
        when "update" then "edit"
        else name
        end
      end

      def reset_tab
        params.delete(:tab)
        params.delete(:anchor_id)
      end

      def should_reset_tab?
        !(same_controller? && same_action?)
      end

      def same_controller?
        return true if resource_scope[:controller].blank?

        resource_scope[:controller] == controller_path
      end

      def same_action?
        resource_scope[:action].presence &&
          action_name_pairing(action_name).eql?(resource_scope[:action])
      end

      def resource_scope
        session.fetch(:resource_scope, {}).with_indifferent_access
      end
    end
  end
end

# Overwrite activeadmin/lib/active_admin/base_controller.rb
ActiveAdmin.after_load do
  ActiveAdmin::BaseController.class_eval do
    prepend Adminterface::Extensions::BaseController
    before_action :reset_tab, if: :should_reset_tab?
    before_action :set_resource_scope
  end
end
