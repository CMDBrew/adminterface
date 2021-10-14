require "test_helper"

module Filters
  class StringInputTest < ActiveAdmin::FilterTestCase
    def find_wrapper(form)
      @wrapper ||= form.find(".input.string")
    end

    setup do
      scope = User.ransack
      @form = render_filter(scope, {name: {as: :string}})
    end

    test "wrapper" do
      assert find_wrapper(@form).present?
    end

    test "label" do
      assert find_wrapper(@form)
        .has_selector?('label.form-label[for="q_name"]')
    end

    test "input" do
      assert find_wrapper(@form).has_selector?("select.form-select")

      assert find_wrapper(@form).has_selector?(
        'input.form-control[type="text"]'\
          '[id="q_name"]'\
          '[name="q[name_contains]"]'
      )
    end
  end
end
