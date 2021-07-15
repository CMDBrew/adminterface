module ActiveAdminBootstrap
  module Extensions
    module Views
      module Columns
        def build(...)
          super(...)
          add_class "row"
        end

        def default_class_name
          columns_css_classes
        end

        protected

        def calculate_columns!
          columns.each(&:assign_column_span)
        end
      end

      module Column
        def assign_column_span
          set_attribute :class, "#{column_klass} #{css_class}".squish
        end

        def column_klass
          ["col", size, span_size].delete_if(&:blank?).join("-")
        end
      end
    end
  end
end

# Overwrite activeadmin/lib/active_admin/views/columns.rb
ActiveAdmin::Views::Columns.class_eval do
  prepend ActiveAdminBootstrap::Extensions::Views::Columns
  has_css_classes_for :columns

  protected

  def closing_tag
    super
  end
end

ActiveAdmin::Views::Column.class_eval do
  prepend ActiveAdminBootstrap::Extensions::Views::Column
  has_breakpoints_for :columns

  attr_reader :size, :span_size, :css_class

  def build(options = {})
    options = options.dup
    @css_class = options.delete(:class)
    @span_size = options.delete(:span)
    @size = options.delete(:size) { columns_breakpoints }
    super(options)
  end
end
