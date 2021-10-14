require "test_helper"

class ColorInputTest < ActiveAdmin::InputTestCase
  setup do
    @form = build_form do |f|
      f.inputs do
        f.input :favorite_color, as: :color
      end
    end

    @wrapper = @form.find(".input.color")
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

class ColorInputGroupingTest < ActiveAdmin::InputTestCase
  test "renders prepend" do
    form = build_form do |f|
      f.inputs do
        f.input :favorite_color, as: :color, prepend: content_tag(:span, "prepend text", class: "input-group-text")
      end
    end

    assert form.has_selector?('.input-group span.input-group-text + input.form-control[type="color"]')
  end

  test "renders append" do
    form = build_form do |f|
      f.inputs do
        f.input :favorite_color, as: :color, append: content_tag(:span, "append text", class: "input-group-text")
      end
    end

    assert form.has_selector?('.input-group input.form-control[type="color"] + span.input-group-text')
  end
end
