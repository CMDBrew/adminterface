module ActiveAdmin
  module Views
    # Overwrite activeadmin/lib/active_admin/views/components/columns.rb
    class Columns < ActiveAdmin::Component
      def default_class_name
        "row"
      end

      # Override add child to set widths
      def add_child(*)
        super
        calculate_columns!
      end

      protected

      # Calculate our columns sizes and margins
      def calculate_columns!
        columns.each(&:assign_column_span)
      end

      def closing_tag
        super
      end
    end

    # Overwrite Columns
    class Column < ActiveAdmin::Component
      include ::ActiveAdminBootstrap::Configs::Finders

      has_breakpoints_for :columns

      def build(options = {})
        options = options.dup
        @klass = options.delete(:class)
        @span_size = options.delete(:span)
        @size = options.delete(:size) { columns_breakpoints }
        super(options)
      end

      def assign_column_span
        set_attribute :class, "#{column_klass} #{@klass}".strip
      end

      def column_klass
        ["col", @size, @span_size].delete_if(&:blank?).join("-")
      end
    end
  end
end
