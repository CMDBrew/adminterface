require "test_case/active_admin/input_test_case"

module SearchInputScenarios
  extend ActiveSupport::Concern

  def find_wrapper(form)
    @wrapper ||= form.find("li.input.search")
  end

  included do
    test "wrapper" do
      assert find_wrapper(@form).present?
    end

    test "label" do
      assert find_wrapper(@form)
        .has_selector?('label.form-label[for="active_admin_input_test_case_form_object_keyword"]')
    end

    test "input" do
      assert find_wrapper(@form).has_selector?(
        'input.form-control[type="search"]'\
          '[id="active_admin_input_test_case_form_object_keyword"]'\
          '[name="active_admin_input_test_case_form_object[keyword]"]'
      )
    end
  end
end

class SearchInputTest < ActiveAdmin::InputTestCase
  include SearchInputScenarios

  setup do
    @form = build_form do |f|
      f.inputs do
        f.input :keyword, as: :search
      end
    end
  end
end

class FloatingSearchInputTest < ActiveAdmin::InputTestCase
  include SearchInputScenarios

  setup do
    @form = build_form do |f|
      f.inputs do
        f.input :keyword, as: :search, floating: true
      end
    end
  end

  test "floating wrapper class" do
    assert find_wrapper(@form)[:class].include?("form-floating")
  end
end
