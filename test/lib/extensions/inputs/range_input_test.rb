require "test_helper"

class RangeInputTest < ActiveAdmin::InputTestCase
  setup do
    @form = build_form do |f|
      f.inputs do
        f.input :volume, as: :range
      end
    end

    @wrapper = @form.find(".input.range")
  end

  test "wrapper" do
    assert @wrapper.present?
  end

  test "label" do
    assert @wrapper
      .has_selector?('label.form-label[for="active_admin_input_test_case_form_object_volume"]')
  end

  test "input" do
    assert @wrapper.has_selector?(
      'input.form-range[type="range"]'\
        '[id="active_admin_input_test_case_form_object_volume"]'\
        '[name="active_admin_input_test_case_form_object[volume]"]'
    )
  end
end
