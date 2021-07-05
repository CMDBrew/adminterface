require "test_case/active_admin/input_test_case"

module PhoneInputScenarios
  extend ActiveSupport::Concern

  def find_wrapper(form)
    @wrapper ||= form.find("li.input.phone")
  end

  included do
    test "wrapper" do
      assert find_wrapper(@form).present?
    end

    test "label" do
      assert find_wrapper(@form)
        .has_selector?('label.form-label[for="active_admin_input_test_case_form_object_telephone"]')
    end

    test "input" do
      assert find_wrapper(@form).has_selector?(
        'input.form-control[type="tel"]'\
          '[id="active_admin_input_test_case_form_object_telephone"]'\
          '[name="active_admin_input_test_case_form_object[telephone]"]'
      )
    end
  end
end

class PhoneInputTest < ActiveAdmin::InputTestCase
  include PhoneInputScenarios

  setup do
    @form = build_form do |f|
      f.inputs do
        f.input :telephone, as: :phone
      end
    end
  end
end
