module Adminterface
  module Extensions
    module BatchActions
      module ResourceSelectionToggleCell
        def build(label_text = "")
          if label_text.present?
            div class: "form-check" do
              input_html
              label label_text, class: "form-check-label"
            end
          else
            input_html
          end
        end

        def input_html
          input type: "checkbox", id: "collection_selection_toggle_all",
            name: "collection_selection_toggle_all", class: "toggle_all form-check-input"
        end
      end

      module ResourceSelectionCell
        def build(resource)
          input type: "checkbox", id: "batch_action_item_#{resource.id}", value: resource.id,
            class: "collection_selection form-check-input", name: "collection_selection[]"
        end
      end
    end
  end
end

# Overwrite activeadmin/lib/active_admin/batch_actions/views/selection_cells.rb
ActiveAdmin::BatchActions::ResourceSelectionToggleCell.class_eval do
  prepend Adminterface::Extensions::BatchActions::ResourceSelectionToggleCell
end

ActiveAdmin::BatchActions::ResourceSelectionCell.class_eval do
  prepend Adminterface::Extensions::BatchActions::ResourceSelectionCell
end
