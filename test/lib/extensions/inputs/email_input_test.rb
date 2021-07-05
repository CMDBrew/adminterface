require "test_case/active_admin/input_test_case"

module EmailInputScenarios
  extend ActiveSupport::Concern

  def find_wrapper(form)
    @wrapper ||= form.find("li.input.email")
  end

  included do
    test "wrapper" do
      assert find_wrapper(@form).present?
    end

    test "label" do
      assert find_wrapper(@form)
        .has_selector?('label.form-label[for="active_admin_input_test_case_form_object_email"]')
    end

    test "input" do
      assert find_wrapper(@form).has_selector?(
        'input.form-control[type="email"]'\
          '[id="active_admin_input_test_case_form_object_email"]'\
          '[name="active_admin_input_test_case_form_object[email]"]'
      )
    end
  end
end

class DatelistInputTest < ActiveAdmin::InputTestCase
  include EmailInputScenarios

  setup do
    @form = build_form do |f|
      f.inputs do
        f.input :email, as: :email
      end
    end
  end
end
