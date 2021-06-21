module ActiveAdmin
  module Views
    # Overwrite activeadmin/lib/active_admin/views/components/table_for.rb
    class TableFor < Arbre::HTML::Table
      include ::ActiveAdminBootstrap::Configs::Finders

      has_css_classes_for :table_for

      def build(obj, *attrs)
        options = attrs.extract_options!
        options[:class] = ["table_for", options[:class], default_css_classes].join(" ").strip
        @sortable = options.delete(:sortable)
        @collection = obj.respond_to?(:each) && !obj.is_a?(Hash) ? obj : [obj]
        @resource_class = options.delete(:i18n)
        @resource_class ||= @collection.klass if @collection.respond_to? :klass
        @columns = []
        @row_class = options.delete(:row_class)

        build_table
        super(options)
        columns(*attrs)
      end

      def default_css_classes
        table_for_css_classes
      end
    end
  end
end
