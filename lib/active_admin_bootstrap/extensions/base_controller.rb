module ActiveAdminBootstrap
  module Extensions
    module BaseController
      def default_url_options
        super.merge(tab: params[:tab], anchor: params[:anchor_id])
      end

      private

      def set_resource_scope
        session[:resource_scope] = {
          controller: controller_name,
          action: action_name
        }
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

        resource_scope[:controller] == controller_name
      end

      def same_action?
        return true if resource_scope[:action].blank?

        case resource_scope[:action]
        when "edit", "update" then %w[edit update].include? action_name
        else action_name == resource_scope[:action]
        end
      end

      def resource_scope
        session.fetch(:resource_scope, {})
      end
    end
  end
end

# Overwrite activeadmin/lib/active_admin/base_controller.rb
ActiveAdmin::BaseController.class_eval do
  prepend ActiveAdminBootstrap::Extensions::BaseController
  before_action :reset_tab, if: :should_reset_tab?
  after_action :set_resource_scope
end
