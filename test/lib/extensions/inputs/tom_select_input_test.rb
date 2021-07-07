require "test_case/active_admin/input_test_case"

class TomSelectInputTest < ActiveAdmin::InputTestCase
  def find_wrapper(form)
    @wrapper ||= form.find("li.input.tom_select")
  end

  setup do
    @form = build_form do |f|
      f.inputs do
        f.input :interests, as: :tom_select, collection: %w[movies]
      end
    end
  end

  test "wrapper" do
    assert find_wrapper(@form).present?
  end

  test "label" do
    assert find_wrapper(@form)
      .has_selector?('label.form-label[for="active_admin_input_test_case_form_object_interests"]')
  end

  test "input" do
    assert find_wrapper(@form).has_selector?(
      "select.form-select"\
        '[id="active_admin_input_test_case_form_object_interests"]'\
        '[name="active_admin_input_test_case_form_object[interests]"]'
    )
  end

  test "js data options" do
    assert_nil(@form.find("select.form-select")["data-tom-select"])
  end
end

class TomSelectGroupingTest < ActiveAdmin::InputTestCase
  test "renders prepend" do
    form = build_form do |f|
      f.inputs do
        f.input :interests, as: :tom_select, collection: %w[movies], prepend: content_tag(:span, "prepend text", class: "input-group-text")
      end
    end

    assert form.has_selector?(".input-group span.input-group-text + select.form-select")
  end

  test "renders append" do
    form = build_form do |f|
      f.inputs do
        f.input :interests, as: :tom_select, collection: %w[movies], append: content_tag(:span, "append text", class: "input-group-text")
      end
    end

    assert form.has_selector?(".input-group select.form-select + span.input-group-text")
  end
end
