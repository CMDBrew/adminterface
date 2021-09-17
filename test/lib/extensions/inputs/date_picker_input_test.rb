require "test_case/active_admin/input_test_case"

module DatePickerInputScenarios
  extend ActiveSupport::Concern

  def find_wrapper(form)
    @wrapper ||= form.find(".input.date_picker")
  end

  def date_picker_config
    @date_picker_config ||= Adminterface::Configs::DEFAULTS.dig(:components, :inputs, :date_picker)
  end

  def flatpickr_config
    @flatpickr_config ||= date_picker_config[:js].find { |x| x[:name].eql?("flatpickr") }
  end

  included do
    test "wrapper" do
      assert find_wrapper(@form).present?
    end

    test "label" do
      assert find_wrapper(@form)
        .has_selector?('label.form-label[for="active_admin_input_test_case_form_object_updated_at"]')
    end

    test "input" do
      assert find_wrapper(@form).has_selector?(
        'input.form-control[type="date"]'\
          '[id="active_admin_input_test_case_form_object_updated_at"]'\
          '[name="active_admin_input_test_case_form_object[updated_at]"]'
      )
    end

    test "js data options" do
      assert_equal(
        flatpickr_config[:options].sort.to_h.to_json,
        @form.find('input.form-control[type="date"]')["data-aa-flatpickr"]
      )
    end
  end
end

class DatePickerInputTest < ActiveAdmin::InputTestCase
  include DatePickerInputScenarios

  setup do
    @form = build_form do |f|
      f.inputs do
        f.input :updated_at, as: :date_picker
      end
    end
  end
end

class DatePickerInputGroupingTest < ActiveAdmin::InputTestCase
  test "renders prepend" do
    form = build_form do |f|
      f.inputs do
        f.input :updated_at, as: :date_picker, prepend: content_tag(:span, "prepend text", class: "input-group-text")
      end
    end

    assert form.has_selector?('.input-group span.input-group-text + input.form-control[type="date"]')
  end

  test "renders append" do
    form = build_form do |f|
      f.inputs do
        f.input :updated_at, as: :date_picker, append: content_tag(:span, "append text", class: "input-group-text")
      end
    end

    assert form.has_selector?('.input-group input.form-control[type="date"] + span.input-group-text')
  end
end
