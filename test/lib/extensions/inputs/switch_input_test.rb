require "test_case/active_admin/input_test_case"

class SwitchInputTest < ActiveAdmin::InputTestCase
  setup do
    @form = build_form do |f|
      f.inputs do
        f.input :accept, as: :switch
      end
    end

    @wrapper = @form.find("li.input.switch .form-check.form-switch")
  end

  test "wrapper" do
    assert @wrapper.present?
  end

  test "label" do
    assert @wrapper
      .has_selector?('label.form-check-label[for="active_admin_input_test_case_form_object_accept"]')
  end

  test "input" do
    assert @wrapper.has_selector?(
      'input.form-check-input[type="checkbox"]'\
        '[id="active_admin_input_test_case_form_object_accept"]'\
        '[name="active_admin_input_test_case_form_object[accept]"]'
    )
  end
end
