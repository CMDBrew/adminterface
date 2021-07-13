module ActiveAdminBootstrap
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
          super(*args, options.merge(button: {class: index_as_table_css_classes.dig(:actions, :item)}), &block)
        end
      end

      module TableActions
        def default_class_name
          "#{super} #{index_as_table_css_classes.dig(:actions, :group)}".squish
        end

        def item(*args)
          options = args.extract_options!
          options[:class] = "#{options[:class]} #{index_as_table_css_classes.dig(:actions, :item)}".squish
          text_node link_to(*args, options)
        end
      end
    end
  end
end

# Overwrite activeadmin/lib/active_admin/views/index_as_table.rb
ActiveAdmin::Views::IndexAsTable.class_eval do
  prepend ActiveAdminBootstrap::Extensions::Views::IndexAsTable
  has_css_classes_for :index_as_table
end

ActiveAdmin::Views::IndexAsTable::IndexTableFor.class_eval do
  prepend ActiveAdminBootstrap::Extensions::Views::IndexTableFor
  has_css_classes_for :index_as_table
end

ActiveAdmin::Views::IndexAsTable::IndexTableFor::TableActions.class_eval do
  prepend ActiveAdminBootstrap::Extensions::Views::TableActions
  has_css_classes_for :index_as_table
end
