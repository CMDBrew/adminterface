require "test_case/active_admin/input_test_case"

module TimeZoneInputScenarios
  extend ActiveSupport::Concern

  def find_wrapper(form)
    @wrapper ||= form.find(".input.time_zone")
  end

  included do
    test "wrapper" do
      assert find_wrapper(@form).present?
    end

    test "label" do
      assert find_wrapper(@form)
        .has_selector?('label.form-label[for="active_admin_input_test_case_form_object_timezone"]')
    end

    test "input" do
      assert find_wrapper(@form).has_selector?(
        "select.form-select"\
          '[id="active_admin_input_test_case_form_object_timezone"]'\
          '[name="active_admin_input_test_case_form_object[timezone]"]'
      )
    end
  end
end

class TimeZoneInputTest < ActiveAdmin::InputTestCase
  include TimeZoneInputScenarios

  setup do
    @form = build_form do |f|
      f.inputs do
        f.input :timezone, as: :time_zone
      end
    end
  end
end

class TimeZoneInputGroupingTest < ActiveAdmin::InputTestCase
  test "renders prepend" do
    form = build_form do |f|
      f.inputs do
        f.input :timezone, as: :time_zone, prepend: content_tag(:span, "prepend text", class: "input-group-text")
      end
    end

    assert form.has_selector?(".input-group span.input-group-text + select.form-select")
  end

  test "renders append" do
    form = build_form do |f|
      f.inputs do
        f.input :timezone, as: :time_zone, append: content_tag(:span, "append text", class: "input-group-text")
      end
    end

    assert form.has_selector?(".input-group select.form-select + span.input-group-text")
  end
end
