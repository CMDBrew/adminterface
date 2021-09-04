module Adminterface
  module Extensions
    module Resource
      module ActionItems
        def action_items_for(action, render_context = nil)
          super.sort_by { |x| [x.group, x.priority] }
        end

        def add_default_action_items
          add_default_new_action_item
          add_default_edit_action_item
          add_default_destroy_action_item
        end

        # Adds the default New link on index
        def add_default_new_action_item
          add_action_item :new, only: proc { components.dig(:action_items, :new, :only)&.map(&:to_sym) } do
            if controller.action_methods.include?("new") && authorized?(ActiveAdmin::Auth::CREATE, active_admin_config.resource_class)
              localizer = ActiveAdmin::Localizers.resource(active_admin_config)
              icon_class = active_admin_config.components.dig(:action_items, :new, :icon_class)

              link_to(
                safe_join([icon_html(icon_class), content_tag(:span, localizer.t(:new_model))]),
                new_resource_path,
                title: localizer.t(:new_model),
                class: active_admin_config.components.dig(:action_items, :new, :css_class)
              )
            end
          end
        end

        # Adds the default Edit link on show
        def add_default_edit_action_item
          add_action_item :edit, only: proc { components.dig(:action_items, :edit, :only)&.map(&:to_sym) } do
            if controller.action_methods.include?("edit") && authorized?(ActiveAdmin::Auth::UPDATE, resource)
              localizer = ActiveAdmin::Localizers.resource(active_admin_config)
              icon_class = active_admin_config.components.dig(:action_items, :edit, :icon_class)

              link_to(
                safe_join([icon_html(icon_class), content_tag(:span, localizer.t(:edit_model))]),
                edit_resource_path(resource),
                title: localizer.t(:edit_model),
                class: active_admin_config.components.dig(:action_items, :edit, :css_class)
              )
            end
          end
        end

        # Adds the default Destroy link on show
        def add_default_destroy_action_item
          add_action_item :destroy, only: proc { components.dig(:action_items, :destroy, :only)&.map(&:to_sym) } do
            if controller.action_methods.include?("destroy") && authorized?(ActiveAdmin::Auth::DESTROY, resource)
              localizer = ActiveAdmin::Localizers.resource(active_admin_config)
              icon_class = active_admin_config.components.dig(:action_items, :destroy, :icon_class)
              confirm_dialog_config = {
                buttons: {
                  ok: {
                    text: I18n.t(:ok, scope: "active_admin.confirm_dialog"),
                    class: active_admin_config.css_classes.dig(:confirm_dialog, :ok)
                  },
                  cancel: {
                    text: I18n.t(:cancel, scope: "active_admin.confirm_dialog"),
                    class: active_admin_config.css_classes.dig(:confirm_dialog, :cancel)
                  }
                }
              }

              link_to(
                safe_join([icon_html(icon_class), content_tag(:span, localizer.t(:delete_model))]),
                resource_path(resource),
                title: localizer.t(:delete_model),
                class: active_admin_config.components.dig(:action_items, :destroy, :css_class),
                method: :delete, data: {confirm: localizer.t(:delete_confirmation), "aa-confirm-dialog": confirm_dialog_config}
              )
            end
          end
        end
      end

      module ActionItem
        def display_on?(action, render_context = self)
          @options[:only] = Array(return_or_proc_exec(@options[:only])) if @options[:only]
          @options[:except] = Array(return_or_proc_exec(@options[:except])) if @options[:except]
          super
        end

        def group
          @options[:group] || 99
        end

        def priority
          @options[:priority] || 99
        end

        private

        def return_or_proc_exec(option)
          option.is_a?(Proc) ? option.call : option
        end

        def normalize_display_options!
          @options[:only] = @options[:only] if @options[:only]
          @options[:except] = @options[:except] if @options[:except]
        end
      end
    end
  end
end

# Overwrite activeadmin/lib/active_admin/resource/action_items.rb
ActiveAdmin::Resource::ActionItems.module_eval do
  prepend Adminterface::Extensions::Resource::ActionItems
end

ActiveAdmin::ActionItem.class_eval do
  prepend Adminterface::Extensions::Resource::ActionItem
end
