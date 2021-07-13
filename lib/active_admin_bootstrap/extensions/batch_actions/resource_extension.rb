module ActiveAdminBootstrap
  module Extensions
    module BatchActions
      module ResourceExtension
        def add_default_batch_action
          destroy_options = {
            priority: 100,
            confirm: proc { I18n.t("active_admin.batch_actions.delete_confirmation", plural_model: active_admin_config.plural_resource_label.downcase) },
            message: proc { I18n.t("active_admin.batch_actions.delete_message") },
            if: proc { controller.action_methods.include?("destroy") && authorized?(ActiveAdmin::Auth::DESTROY, active_admin_config.resource_class) }
          }

          add_batch_action :destroy, proc { I18n.t("active_admin.delete") }, destroy_options do |selected_ids|
            batch_action_collection.find(selected_ids).each do |record|
              authorize! ActiveAdmin::Auth::DESTROY, record
              destroy_resource(record)
            end

            redirect_to active_admin_config.route_collection_path(params),
              notice: I18n.t("active_admin.batch_actions.succesfully_destroyed",
                count: selected_ids.count,
                model: active_admin_config.resource_label.downcase,
                plural_model: active_admin_config.plural_resource_label(count: selected_ids.count).downcase)
          end
        end
      end
    end

    module BatchAction
      def confirm_dialog
        @confirm_dialog ||= find_confirm_dialog
      end

      private

      def find_confirm_dialog
        options = @options[:confirm_dialog] || {}
        {
          buttons: {
            ok: {
              text: I18n.t(:ok, scope: "active_admin.batch_actions.confirm_dialog"),
              class: table_tools_css_classes.dig(:confirm_dialog, :ok)
            },
            cancel: {
              text: I18n.t(:cancel, scope: "active_admin.batch_actions.confirm_dialog"),
              class: table_tools_css_classes.dig(:confirm_dialog, :cancel)
            }
          }
        }.deep_merge(options)
      end
    end
  end
end

# Overwrite activeadmin/lib/active_admin/batch_actions/resource_extension.rb
ActiveAdmin::BatchActions::ResourceExtension.module_eval do
  prepend ActiveAdminBootstrap::Extensions::BatchActions::ResourceExtension
end

ActiveAdmin::BatchAction.class_eval do
  include ActiveAdminBootstrap::Configs::Finders
  prepend ActiveAdminBootstrap::Extensions::BatchAction
  has_css_classes_for :table_tools
end
