require "test_case/active_admin/input_test_case"

class ColorInputTest < ActiveAdmin::InputTestCase
  setup do
    @form = build_form do |f|
      f.inputs do
        f.input :favorite_color, as: :color
      end
    end

    @wrapper = @form.find("li.input.color")
  end

  test "wrapper" do
    assert @wrapper.present?
  end

  test "label" do
    assert @wrapper
      .has_selector?('label.form-label[for="active_admin_input_test_case_form_object_favorite_color"]')
  end

  test "input" do
    assert @wrapper.has_selector?(
      'input.form-control.form-control-color[type="color"]'\
        '[id="active_admin_input_test_case_form_object_favorite_color"]'\
        '[name="active_admin_input_test_case_form_object[favorite_color]"]'
    )
  end
end
