require "test_case/active_admin/input_test_case"

module DatePickerInputScenarios
  extend ActiveSupport::Concern

  def find_wrapper(form)
    @wrapper ||= form.find("li.input.date_picker")
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
        'input.form-control[type="date"]'\
          '[id="active_admin_input_test_case_form_object_updated_at"]'\
          '[name="active_admin_input_test_case_form_object[updated_at]"]'
      )
    end

    test "js data options" do
      assert_equal(
        {enableTime: false, altFormat: "Y-m-d"}.to_json,
        @form.find('input.form-control[type="date"]')["data-aa-datepicker"]
      )
    end
  end
end

class DatePickerInputTest < ActiveAdmin::InputTestCase
  include DatePickerInputScenarios

  setup do
    @form = build_form do |f|
      f.inputs do
        f.input :updated_at, as: :date_picker
      end
    end
  end
end
