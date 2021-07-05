require "test_case/active_admin/input_test_case"

module TextInputScenarios
  extend ActiveSupport::Concern

  def find_wrapper(form)
    @wrapper ||= form.find("li.input.text")
  end

  included do
    test "wrapper" do
      assert find_wrapper(@form).present?
    end

    test "label" do
      assert find_wrapper(@form)
        .has_selector?('label.form-label[for="active_admin_input_test_case_form_object_biography"]')
    end

    test "input" do
      assert find_wrapper(@form).has_selector?(
        "textarea.form-control"\
          '[id="active_admin_input_test_case_form_object_biography"]'\
          '[name="active_admin_input_test_case_form_object[biography]"]'
      )
    end
  end
end

class TextInputTest < ActiveAdmin::InputTestCase
  include TextInputScenarios

  setup do
    @form = build_form do |f|
      f.inputs do
        f.input :biography, as: :text
      end
    end
  end
end
