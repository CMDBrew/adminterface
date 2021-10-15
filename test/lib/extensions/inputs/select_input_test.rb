require "test_helper"

module SelectInputScenarios
  extend ActiveSupport::Concern

  def find_wrapper(form)
    @wrapper ||= form.find(".input.select")
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

class SelectInputTomSelectTest < ActiveAdmin::InputTestCase
  test "enables tom_select" do
    form = build_form do |f|
      f.inputs do
        f.input :interests, as: :select, collection: %w[movies], tom_select: true
      end
    end

    assert form.find("select")["data-aa-tom-select"].present?
  end

  test "passes tom_select options" do
    form = build_form do |f|
      f.inputs do
        f.input :interests, as: :select, collection: %w[movies], tom_select: {a: 1}
      end
    end

    assert_equal({a: 1}.to_json, form.find("select")["data-aa-tom-select"])
  end
end

class SelectInputGroupingTest < ActiveAdmin::InputTestCase
  test "renders prepend" do
    form = build_form do |f|
      f.inputs do
        f.input :interests, as: :select, collection: %w[movies], prepend: content_tag(:span, "prepend text", class: "input-group-text")
      end
    end

    assert form.has_selector?(".input-group span.input-group-text + select.form-select")
  end

  test "renders append" do
    form = build_form do |f|
      f.inputs do
        f.input :interests, as: :select, collection: %w[movies], append: content_tag(:span, "append text", class: "input-group-text")
      end
    end

    assert form.has_selector?(".input-group select.form-select + span.input-group-text")
  end
end
