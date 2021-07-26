module ActiveAdminBootstrap
  module Extensions
    module Views
      module Components
        module AttributesTable
          def table
            super(class: attributes_table_css_classes[:table])
          end

          def default_class_name
            "#{super} #{attributes_table_css_classes[:wrapper]}".squish
          end

          def tr(options = {})
            options[:class] = options[:class].split.reject { |x| x.eql?("row") }.join(" ")
            super(options)
          end
        end
      end
    end
  end
end

# Overwirte lib/active_admin/views/components/attributes_table.rb
ActiveAdmin::Views::AttributesTable.class_eval do
  prepend ActiveAdminBootstrap::Extensions::Views::Components::AttributesTable
  has_css_classes_for :attributes_table
end
