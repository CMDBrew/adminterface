module ActiveAdmin
  class Resource
    # Overwrite ActionItems - activeadmin/lib/active_admin/resource/action_items.rb
    module ActionItems
      def action_items_for(action, render_context = nil)
        action_items.select { |item| item.display_on? action, render_context }
          .sort_by { |x| [x.group, x.priority] }
      end

      # Adds the default New link on index
      def add_default_new_action_item
        add_action_item :new, only: proc { components.dig(:action_items, :new, :display) } do
          if controller.action_methods.include?("new") &&
              authorized?(ActiveAdmin::Auth::CREATE, active_admin_config.resource_class)

            localizer = ActiveAdmin::Localizers.resource(active_admin_config)
            link_to(
              safe_join([active_admin_config.components.dig(:action_items, :new, :prefix)&.html_safe, content_tag(:span, localizer.t(:new_model))]),
              new_resource_path, title: localizer.t(:new_model),
                                 class: active_admin_config.components.dig(:action_items, :new, :class)
            )
          end
        end
      end

      # Adds the default Edit link on show
      def add_default_edit_action_item
        add_action_item :edit, only: proc { components.dig(:action_items, :edit, :display) } do
          if controller.action_methods.include?("edit") &&
              authorized?(ActiveAdmin::Auth::UPDATE, resource)
            localizer = ActiveAdmin::Localizers.resource(active_admin_config)
            link_to(
              safe_join([active_admin_config.components.dig(:action_items, :edit, :prefix)&.html_safe, content_tag(:span, localizer.t(:edit_model))]),
              edit_resource_path(resource), title: localizer.t(:edit_model),
                                            class: active_admin_config.components.dig(:action_items, :edit, :class)
            )
          end
        end
      end

      # Adds the default Destroy link on show
      def add_default_destroy_action_item
        add_action_item :destroy, only: proc { components.dig(:action_items, :destroy, :display) } do
          if controller.action_methods.include?("destroy") &&
              authorized?(ActiveAdmin::Auth::DESTROY, resource)
            link_to(
              safe_join([active_admin_config.components.dig(:action_items, :destroy, :prefix)&.html_safe, content_tag(:span, localizer.t(:delete_model))]),
              resource_path(resource), title: localizer.t(:delete_model),
                                       class: active_admin_config.components.dig(:action_items, :destroy, :class),
                                       method: :delete, data: {confirm: localizer.t(:delete_confirmation), message: localizer.t(:delete_confirmation_message)}
            )
          end
        end
      end
    end
  end

  # Model class to store the data for ActionItems
  class ActionItem
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