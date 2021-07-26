require "test_case/active_admin/filter_test_case"

module Filters
  class BooleanInputTest < ActiveAdmin::FilterTestCase
    def find_wrapper(form)
      @wrapper ||= form.find(".input.boolean")
    end

    setup do
      scope = User.ransack
      @form = render_filter(scope, {name: {as: :boolean}})
    end

    test "wrapper" do
      assert find_wrapper(@form).present?
    end

    test "label" do
      assert find_wrapper(@form)
        .has_selector?('label.form-label[for="q_name"]')
    end

    test "input" do
      assert find_wrapper(@form).has_selector?(
        "select.form-select"\
          '[id="q_name"]'\
          '[name="q[name_eq]"]'
      )
    end
  end
end
