require "test_case/active_admin/input_test_case"

module SearchInputScenarios
  extend ActiveSupport::Concern

  def find_wrapper(form)
    @wrapper ||= form.find(".input.search")
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

class SearchInputGroupingTest < ActiveAdmin::InputTestCase
  test "renders prepend" do
    form = build_form do |f|
      f.inputs do
        f.input :keyword, as: :search, prepend: content_tag(:span, "prepend text", class: "input-group-text")
      end
    end

    assert form.has_selector?('.input-group span.input-group-text + input.form-control[type="search"]')
  end

  test "renders append" do
    form = build_form do |f|
      f.inputs do
        f.input :keyword, as: :search, append: content_tag(:span, "append text", class: "input-group-text")
      end
    end

    assert form.has_selector?('.input-group input.form-control[type="search"] + span.input-group-text')
  end
end
