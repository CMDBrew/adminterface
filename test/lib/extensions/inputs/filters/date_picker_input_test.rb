require "test_case/active_admin/filter_test_case"

module Filters
  class DatePickerInputTest < ActiveAdmin::FilterTestCase
    def find_wrapper(form)
      @wrapper ||= form.find(".input.date_picker")
    end

    def date_picker_config
      @date_picker_config ||= Adminterface::Configs::DEFAULTS.dig(:components, :inputs, :date_picker)
    end

    setup do
      scope = User.ransack
      @form = render_filter(scope, {updated_at: {as: :date_picker}})
    end

    test "wrapper" do
      assert find_wrapper(@form).present?
    end

    test "label" do
      assert find_wrapper(@form)
        .has_selector?('label.form-label[for="q_updated_at"]')
    end

    test "input" do
      assert find_wrapper(@form).has_selector?(
        'input.form-control[type="date"]'\
          '[id="q_updated_at"]'\
          '[name="q[updated_at]"]'
      )
    end

    test "js data options" do
      assert_equal(
        date_picker_config.to_json,
        @form.find('input.form-control[type="date"]')["data-aa-datepicker"]
      )
    end
  end
end
