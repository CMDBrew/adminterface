require "test_helper"

module Filters
  class DateRangeInputTest < ActiveAdmin::FilterTestCase
    def find_wrapper(form)
      @wrapper ||= form.find(".input.date_range")
    end

    setup do
      scope = User.ransack
      @form = render_filter(scope, {updated_at: {as: :date_range}})
    end

    test "wrapper" do
      assert find_wrapper(@form).present?
    end

    test "label" do
      assert find_wrapper(@form)
        .has_selector?("label.form-label")
    end

    test "inputs" do
      assert find_wrapper(@form).has_selector?(
        'input.form-control[type="text"]'\
          '[id="q_updated_at_gteq_datetime"]'\
          '[name="q[updated_at_gteq_datetime]"]'
      )

      assert find_wrapper(@form).has_selector?(
        'input.form-control[type="text"]'\
          '[id="q_updated_at_lteq_datetime"]'\
          '[name="q[updated_at_lteq_datetime]"]'
      )
    end

    test "js data options" do
      assert_equal(
        {enableTime: false, altInput: true, altFormat: "Y-m-d"}.sort.to_h.to_json,
        @form.find('input.form-control[type="text"][id="q_updated_at_gteq_datetime"]')["data-aa-flatpickr"]
      )

      assert_equal(
        {enableTime: false, altInput: true, altFormat: "Y-m-d"}.sort.to_h.to_json,
        @form.find('input.form-control[type="text"][id="q_updated_at_lteq_datetime"]')["data-aa-flatpickr"]
      )
    end
  end
end
