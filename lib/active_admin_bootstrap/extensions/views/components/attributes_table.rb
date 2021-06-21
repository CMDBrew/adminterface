module ActiveAdmin
  module Views
    # Overwirte activeadmin/lib/active_admin/views/components/attributes_table.rb
    class AttributesTable < ActiveAdmin::Component
      include ::ActiveAdminBootstrap::Configs::Finders

      has_css_classes_for :attributes_table

      def table
        super(class: attributes_table_css_classes[:table])
      end

      def default_class_name
        "attributes_table #{attributes_table_css_classes[:wrapper]}".strip
      end
    end
  end
end
