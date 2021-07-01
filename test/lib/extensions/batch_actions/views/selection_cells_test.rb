require "test_case/active_admin/base_test_case"

class SelectionCellsTest < ActiveAdmin::BaseTestCase
  test "#class_list" do
    component = render_arbre_component do
      resource_selection_toggle_cell
    end

    assert component.class_list.include?("resource_selection_toggle_cell")
  end

  test "with label #html" do
    component = render_arbre_component do
      resource_selection_toggle_cell "record"
    end

    html =
      <<~HTML
        <div class="form-check">
          <input type="checkbox" id="collection_selection_toggle_all" name="collection_selection_toggle_all" class="toggle_all form-check-input"/>
          <label class="form-check-label">record</label>
        </div>
      HTML
    assert_html html, component.content
  end

  test "without label #html" do
    component = render_arbre_component do
      resource_selection_toggle_cell
    end

    html =
      <<~HTML
        <input type="checkbox" id="collection_selection_toggle_all" name="collection_selection_toggle_all" class="toggle_all form-check-input"/>
      HTML
    assert_html html, component.content
  end
end
