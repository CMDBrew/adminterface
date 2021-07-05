require "test_case/active_admin/input_test_case"

module UrlInputScenarios
  extend ActiveSupport::Concern

  def find_wrapper(form)
    @wrapper ||= form.find("li.input.url")
  end

  included do
    test "wrapper" do
      assert find_wrapper(@form).present?
    end

    test "label" do
      assert find_wrapper(@form)
        .has_selector?('label.form-label[for="active_admin_input_test_case_form_object_website"]')
    end

    test "input" do
      assert find_wrapper(@form).has_selector?(
        'input.form-control[type="url"]'\
          '[id="active_admin_input_test_case_form_object_website"]'\
          '[name="active_admin_input_test_case_form_object[website]"]'
      )
    end
  end
end

class UrlInputTest < ActiveAdmin::InputTestCase
  include UrlInputScenarios

  setup do
    @form = build_form do |f|
      f.inputs do
        f.input :website, as: :url
      end
    end
  end
end
