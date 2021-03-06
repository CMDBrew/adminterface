module Adminterface
  module Extensions
    module Views
      module IndexAsGrid
        def size
          @page_presenter[:size] || index_as_grid_components[:breakpoint]
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
          div class: "#{column_klass} #{index_as_grid_css_classes[:item]}".squish, for: item do
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
end

# Overwrite activeadmin/lib/active_admin/views/index_as_grid.rb
ActiveAdmin::Views::IndexAsGrid.class_eval do
  prepend Adminterface::Extensions::Views::IndexAsGrid
  has_css_classes_for :index_as_grid
  has_components_for :index_as_grid
end
