module ActiveAdmin
  module Views
    # Overwirte activeadmin/lib/active_admin/views/components/attributes_table.rb
    class AttributesTable < ActiveAdmin::Component
      include ::ActiveAdminBootstrap::Configs::Finders

      has_css_classes_for :attributes_table

      def build(obj, *attrs)
        @collection = Array.wrap(obj)
        @resource_class = @collection.first.class
        options = {}
        options[:for] = @collection.first if single_record?
        super(options)
        @table = table(class: attributes_table_css_classes[:table])
        build_colgroups
        rows(*attrs)
      end

      def default_class_name
        "attributes_table #{attributes_table_css_classes[:wrapper]}".strip
      end

      def row(*args, &block)
        title = args[0]
        options = args.extract_options!
        classes = []
        if options[:class]
          classes << options[:class]
        elsif title.present?
          classes << "row-#{title.to_s.parameterize(separator: "_")}"
        end
        options[:class] = classes.join(" ")

        @table << tr(options) do
          th do
            header_content_for(title)
          end
          @collection.each do |record|
            td do
              content_for(record, block || title)
            end
          end
        end
      end
    end
  end
end
