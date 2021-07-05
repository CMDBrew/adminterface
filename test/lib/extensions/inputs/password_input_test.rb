require "test_case/active_admin/input_test_case"

module PasswordInputScenarios
  extend ActiveSupport::Concern

  def find_wrapper(form)
    @wrapper ||= form.find("li.input.password")
  end

  included do
    test "wrapper" do
      assert find_wrapper(@form).present?
    end

    test "label" do
      assert find_wrapper(@form)
        .has_selector?('label.form-label[for="active_admin_input_test_case_form_object_secret"]')
    end

    test "input" do
      assert find_wrapper(@form).has_selector?(
        'input.form-control[type="password"]'\
          '[id="active_admin_input_test_case_form_object_secret"]'\
          '[name="active_admin_input_test_case_form_object[secret]"]'
      )
    end
  end
end

class PasswordInputTest < ActiveAdmin::InputTestCase
  include PasswordInputScenarios

  setup do
    @form = build_form do |f|
      f.inputs do
        f.input :secret, as: :password
      end
    end
  end
end
