require "test_case/active_admin/input_test_case"

module NumberInputScenarios
  extend ActiveSupport::Concern

  def find_wrapper(form)
    @wrapper ||= form.find("li.input.number")
  end

  included do
    test "wrapper" do
      assert find_wrapper(@form).present?
    end

    test "label" do
      assert find_wrapper(@form)
        .has_selector?('label.form-label[for="active_admin_input_test_case_form_object_quantity"]')
    end

    test "input" do
      assert find_wrapper(@form).has_selector?(
        'input.form-control[type="number"]'\
          '[id="active_admin_input_test_case_form_object_quantity"]'\
          '[name="active_admin_input_test_case_form_object[quantity]"]'
      )
    end
  end
end

class NumberInputTest < ActiveAdmin::InputTestCase
  include NumberInputScenarios

  setup do
    @form = build_form do |f|
      f.inputs do
        f.input :quantity, as: :number
      end
    end
  end
end
