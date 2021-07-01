require "test_case/active_admin/input_test_case"

class CheckBoxesInputTest < ActiveAdmin::InputTestCase
  setup do
    @form = build_form do |f|
      f.inputs do
        f.input :interests, as: :check_boxes, collection: %w[movies]
      end
    end

    @wrapper = @form.find("li.input.check_boxes .choices")
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
      'input.form-check-input[type="checkbox"]'\
        '[id="active_admin_input_test_case_form_object_interests_movies"]'\
        '[name="active_admin_input_test_case_form_object[interests][]"]'
    )
  end
end
