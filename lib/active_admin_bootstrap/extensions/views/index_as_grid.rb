module ActiveAdmin
  module Views
    # Overwrite activeadmin/lib/active_admin/views/index_as_grid.rb
    class IndexAsGrid < ActiveAdmin::Component
      include ::ActiveAdminBootstrap::Configs::Finders

      has_css_classes_for :index_as_grid
      has_breakpoints_for :index_as_grid

      def size
        @page_presenter[:size] || index_as_grid_breakpoints
      end

      protected

      def build_table
        resource_selection_toggle_panel if active_admin_config.batch_actions.any?
        div class: "index_grid" do
          @collection.in_groups_of(number_of_columns).each do |group|
            build_row(group)
          end
        end
      end

      def build_row(group)
        div class: index_as_grid_css_classes[:group] do
          group.each do |item|
            next if item.blank?

            build_item(item)
          end
        end
      end

      def build_item(item)
        div class: "#{column_klass} #{index_as_grid_css_classes[:item]}".strip, for: item do
          instance_exec(item, &@page_presenter.block)
        end
      end

      def span_size
        12 / number_of_columns
      end

      def column_klass
        ["col", size, span_size].delete_if(&:blank?).join("-")
      end
    end
  end
end
