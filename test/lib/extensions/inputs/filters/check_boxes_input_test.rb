require "test_case/active_admin/filter_test_case"

module Filters
  class CheckBoxesInputTest < ActiveAdmin::FilterTestCase
    def find_wrapper(form)
      @wrapper ||= form.find(".input.check_boxes .choices")
    end

    setup do
      scope = User.ransack
      @form = render_filter(scope, {name: {as: :check_boxes, collection: %w[movies]}})
    end

    test "wrapper" do
      assert find_wrapper(@form).present?
    end

    test "label" do
      assert find_wrapper(@form)
        .has_selector?('label.form-check-label[for="q_name_movies"]')
    end

    test "input" do
      assert find_wrapper(@form).has_selector?(
        'input.form-check-input[type="checkbox"]'\
          '[id="q_name_movies"]'\
          '[name="q[name_in][]"]'
      )
    end
  end
end
