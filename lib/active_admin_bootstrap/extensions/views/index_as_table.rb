module ActiveAdmin
  module Views
    # Overwrite activeadmin/lib/active_admin/views/index_as_table.rb
    class IndexAsTable < ActiveAdmin::Component
      include ::ActiveAdminBootstrap::Configs::Finders

      has_css_classes_for :index_as_table

      def table_for(*args, &block)
        options = args.extract_options!
        div class: index_as_table_css_classes[:wrapper] do
          insert_tag IndexTableFor, *args.push(options), &block
        end
      end

      def default_class_name
        "index_as_table index"
      end

      # Overwrite IndexTableActions
      class IndexTableFor < ::ActiveAdmin::Views::TableFor
        include ::ActiveAdminBootstrap::Configs::Finders

        has_css_classes_for :index_as_table

        def default_css_classes
          index_as_table_css_classes[:table]
        end

        def actions(options = {}, &block)
          name = options.delete(:name) { "" }
          defaults = options.delete(:defaults) { true }
          dropdown = options.delete(:dropdown) { false }
          dropdown_name = options.delete(:dropdown_name) do
            I18n.t "active_admin.dropdown_actions.button_label", default: "Actions"
          end

          options[:class] ||= "col-actions"

          column name, options do |resource|
            if dropdown
              dropdown_menu dropdown_name&.html_safe do
                defaults(resource) if defaults
                instance_exec(resource, &block) if block
              end
            else
              table_actions do
                defaults(resource, css_class: :member_link) if defaults
                if block
                  block_result = instance_exec(resource, &block)
                  text_node block_result unless block_result.is_a? Arbre::Element
                end
              end
            end
          end
        end

        def dropdown_menu(*args, &block)
          options = args.extract_options!
          super(*args, options.merge(button: {class: index_as_table_css_classes.dig(:actions, :item)}), &block)
        end

        private

        def defaults(resource, options = {})
          localizer = ActiveAdmin::Localizers.resource(active_admin_config)
          if controller.action_methods.include?("show") &&
              authorized?(ActiveAdmin::Auth::READ, resource)
            item localizer.t(:view), resource_path(resource),
              class: "view_link #{options[:css_class]}", title: localizer.t(:view)
          end

          if controller.action_methods.include?("edit") &&
              authorized?(ActiveAdmin::Auth::UPDATE, resource)
            item localizer.t(:edit), edit_resource_path(resource),
              class: "edit_link #{options[:css_class]}", title: localizer.t(:edit)
          end

          if controller.action_methods.include?("destroy") &&
              authorized?(ActiveAdmin::Auth::DESTROY, resource)
            item localizer.t(:delete), resource_path(resource),
              class: "delete_link #{options[:css_class]}", title: localizer.t(:delete),
              method: :delete,
              data: {
                confirm: localizer.t(:delete_confirmation),
                message: localizer.t(:delete_message)
              }
          end
        end

        # Overwrite TableActions
        class TableActions < ActiveAdmin::Component
          include ::ActiveAdminBootstrap::Configs::Finders

          def default_class_name
            "table_actions #{index_as_table_css_classes.dig(:actions, :group)}".strip
          end

          def item(*args)
            options = args.extract_options!
            options[:class] =
              "#{options[:class]} #{index_as_table_css_classes.dig(:actions, :item)}".strip
            text_node link_to(*args, options)
          end
        end
      end
    end
  end
end
