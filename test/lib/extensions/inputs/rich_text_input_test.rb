require "test_case/active_admin/input_test_case"

class RichTextInputTest < ActiveAdmin::InputTestCase
  setup do
    @form = build_form do |f|
      f.inputs do
        f.input :biography, as: :rich_text
      end
    end

    @wrapper = @form.find(".input.rich_text")
  end

  test "wrapper" do
    assert @wrapper.present?
  end

  test "label" do
    assert @wrapper
      .has_selector?('label.form-label[for="active_admin_input_test_case_form_object_biography"]')
  end

  test "input" do
    assert @wrapper.has_selector?(
      'input[type="hidden"]'\
        '[id="active_admin_input_test_case_form_object_biography_trix_input_active_admin_input_test_case_form_object"]'\
        '[name="active_admin_input_test_case_form_object[biography]"]',
      visible: false
    )
  end

  test "editor" do
    assert @wrapper.has_selector?(
      "trix-editor.form-control.trix-content"\
        '[id="active_admin_input_test_case_form_object_biography"]'\
        '[input="active_admin_input_test_case_form_object_biography_trix_input_active_admin_input_test_case_form_object"]'
    )
  end
end
