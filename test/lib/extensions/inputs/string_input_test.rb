require "test_case/active_admin/input_test_case"

module StringInputScenarios
  extend ActiveSupport::Concern

  def find_wrapper(form)
    @wrapper ||= form.find("li.input.string")
  end

  included do
    test "wrapper" do
      assert find_wrapper(@form).present?
    end

    test "label" do
      assert find_wrapper(@form)
        .has_selector?('label.form-label[for="active_admin_input_test_case_form_object_name"]')
    end

    test "input" do
      assert find_wrapper(@form).has_selector?(
        'input.form-control[type="text"]'\
          '[id="active_admin_input_test_case_form_object_name"]'\
          '[name="active_admin_input_test_case_form_object[name]"]'
      )
    end
  end
end

class StringInputTest < ActiveAdmin::InputTestCase
  include StringInputScenarios

  setup do
    @form = build_form do |f|
      f.inputs do
        f.input :name, as: :string
      end
    end
  end
end

class StringInputGroupingTest < ActiveAdmin::InputTestCase
  test "renders prepend" do
    form = build_form do |f|
      f.inputs do
        f.input :name, as: :string, prepend: content_tag(:span, "prepend text", class: "input-group-text")
      end
    end

    assert form.has_selector?('.input-group span.input-group-text + input.form-control[type="text"]')
  end

  test "renders append" do
    form = build_form do |f|
      f.inputs do
        f.input :name, as: :string, append: content_tag(:span, "append text", class: "input-group-text")
      end
    end

    assert form.has_selector?('.input-group input.form-control[type="text"] + span.input-group-text')
  end
end
