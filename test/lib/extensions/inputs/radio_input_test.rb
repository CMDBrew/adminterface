require "test_case/active_admin/input_test_case"

class RadioInputTest < ActiveAdmin::InputTestCase
  setup do
    @form = build_form do |f|
      f.inputs do
        f.input :interests, as: :radio, collection: %w[movies]
      end
    end

    @wrapper = @form.find("li.input.radio .choices")
  end

  test "wrapper" do
    assert @wrapper.present?
  end

  test "label" do
    assert @wrapper
      .has_selector?('label.form-check-label[for="active_admin_input_test_case_form_object_interests_movies"]')
  end

  test "input" do
    assert @wrapper.has_selector?(
      'input.form-check-input[type="radio"]'\
        '[id="active_admin_input_test_case_form_object_interests_movies"]'\
        '[name="active_admin_input_test_case_form_object[interests]"]'
    )
  end
end
