module Adminterface
  module Extensions
    module Views
      module IndexAsTable
        def table_for(*args, &block)
          div class: index_as_table_css_classes[:wrapper] do
            super(*args, &block)
          end
        end

        def default_class_name
          "#{super} index"
        end
      end

      module IndexTableFor
        def default_css_classes
          "#{super} #{index_as_table_css_classes[:table]}".squish
        end

        def dropdown_menu(*args, &block)
          options = args.extract_options!
          super(*args, options.merge(button: {class: index_as_table_css_classes.dig(:actions, :dropdown, :toggle)}), &block)
        end
      end

      module TableActions
        def default_class_name
          "#{super} #{index_as_table_css_classes.dig(:actions, :buttons, :group)}".squish
        end

        def item(*args)
          options = args.extract_options!
          options[:class] = "#{options[:class]} #{index_as_table_css_classes.dig(:actions, :buttons, :item)}".squish
          options["data-aa-confirm-dialog"] = confirm_dialog_config.to_json if confirm?(options)
          text_node link_to(*args, options)
        end

        def confirm?(options)
          options.dig(:data, :confirm).present?
        end

        def confirm_dialog_config
          {
            buttons: {
              confirm: {
                text: I18n.t(:confirm, scope: "active_admin.confirm_dialog"),
                class: confirm_dialog_css_classes[:confirm]
              },
              cancel: {
                text: I18n.t(:cancel, scope: "active_admin.confirm_dialog"),
                class: confirm_dialog_css_classes[:cancel]
              }
            }
          }
        end
      end
    end
  end
end

# Overwrite activeadmin/lib/active_admin/views/index_as_table.rb
ActiveAdmin::Views::IndexAsTable.class_eval do
  prepend Adminterface::Extensions::Views::IndexAsTable
  has_css_classes_for :index_as_table
end

ActiveAdmin::Views::IndexAsTable::IndexTableFor.class_eval do
  prepend Adminterface::Extensions::Views::IndexTableFor
  has_css_classes_for :index_as_table
end

ActiveAdmin::Views::IndexAsTable::IndexTableFor::TableActions.class_eval do
  prepend Adminterface::Extensions::Views::TableActions
  has_css_classes_for :index_as_table
  has_css_classes_for :confirm_dialog
end
