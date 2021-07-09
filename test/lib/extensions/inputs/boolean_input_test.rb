require "test_case/active_admin/input_test_case"

class BooleanInputTest < ActiveAdmin::InputTestCase
  setup do
    @form = build_form do |f|
      f.inputs do
        f.input :accept, as: :boolean
      end
    end

    @wrapper = @form.find(".input.boolean .form-check")
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
