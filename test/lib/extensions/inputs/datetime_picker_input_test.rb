require "test_case/active_admin/input_test_case"

module DatetimePickerInputScenarios
  extend ActiveSupport::Concern

  def find_wrapper(form)
    @wrapper ||= form.find("li.input.datetime_picker")
  end

  included do
    test "wrapper" do
      assert find_wrapper(@form).present?
    end

    test "label" do
      assert find_wrapper(@form)
        .has_selector?('label.form-label[for="active_admin_input_test_case_form_object_updated_at"]')
    end

    test "input" do
      assert find_wrapper(@form).has_selector?(
        'input.form-control[type="datetime-local"]'\
          '[id="active_admin_input_test_case_form_object_updated_at"]'\
          '[name="active_admin_input_test_case_form_object[updated_at]"]'
      )
    end

    test "js data options" do
      assert_equal(
        {enableTime: true, altFormat: "Y-m-d, h:i K"}.to_json,
        @form.find('input.form-control[type="datetime-local"]')["data-aa-datepicker"]
      )
    end
  end
end

class DatetimePickerInputTest < ActiveAdmin::InputTestCase
  include DatetimePickerInputScenarios

  setup do
    @form = build_form do |f|
      f.inputs do
        f.input :updated_at, as: :datetime_picker
      end
    end
  end
end

class DatetimePickerInputGroupingTest < ActiveAdmin::InputTestCase
  test "renders prepend" do
    form = build_form do |f|
      f.inputs do
        f.input :updated_at, as: :datetime_picker, prepend: content_tag(:span, "prepend text", class: "input-group-text")
      end
    end

    assert form.has_selector?('.input-group span.input-group-text + input.form-control[type="datetime-local"]')
  end

  test "renders append" do
    form = build_form do |f|
      f.inputs do
        f.input :updated_at, as: :datetime_picker, append: content_tag(:span, "append text", class: "input-group-text")
      end
    end

    assert form.has_selector?('.input-group input.form-control[type="datetime-local"] + span.input-group-text')
  end
end
