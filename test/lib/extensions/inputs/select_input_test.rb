require "test_case/active_admin/input_test_case"

module SelectInputScenarios
  extend ActiveSupport::Concern

  def find_wrapper(form)
    @wrapper ||= form.find("li.input.select")
  end

  included do
    test "wrapper" do
      assert find_wrapper(@form).present?
    end

    test "label" do
      assert find_wrapper(@form)
        .has_selector?('label.form-label[for="active_admin_input_test_case_form_object_interests"]')
    end

    test "input" do
      assert find_wrapper(@form).has_selector?(
        "select.form-select"\
          '[id="active_admin_input_test_case_form_object_interests"]'\
          '[name="active_admin_input_test_case_form_object[interests]"]'
      )
    end
  end
end

class SelectInputTest < ActiveAdmin::InputTestCase
  include SelectInputScenarios

  setup do
    @form = build_form do |f|
      f.inputs do
        f.input :interests, as: :select, collection: %w[movies]
      end
    end
  end
end

class FloatingSelectInputTest < ActiveAdmin::InputTestCase
  include SelectInputScenarios

  setup do
    @form = build_form do |f|
      f.inputs do
        f.input :interests, as: :select, collection: %w[movies], floating: true
      end
    end
  end

  test "floating wrapper class" do
    assert find_wrapper(@form)[:class].include?("form-floating")
  end
end
