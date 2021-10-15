require "test_helper"

class TextInputTest < ActiveAdmin::InputTestCase
  def find_wrapper(form)
    @wrapper ||= form.find(".input.text")
  end

  setup do
    @form = build_form do |f|
      f.inputs do
        f.input :biography, as: :text
      end
    end
  end

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

class TextInputCounterTest < ActiveAdmin::InputTestCase
  def input_counter_config
    @input_counter_config ||=
      Adminterface::Configs::DEFAULTS.dig(:components, :inputs, :text, :js).find { |x| x[:name].eql?("input-counter") }
  end

  test "enables counter" do
    form = build_form do |f|
      f.inputs do
        f.input :biography, as: :text, input_counter: true
      end
    end

    assert_equal(input_counter_config[:options].sort.to_h.to_json, form.find("textarea")["data-aa-input-counter"])
  end

  test "disables counter" do
    form = build_form do |f|
      f.inputs do
        f.input :biography, as: :text, input_counter: false
      end
    end

    refute form.has_selector?("textarea[data-aa-input-counter]")
  end

  test "overrides default config" do
    form = build_form do |f|
      f.inputs do
        f.input :biography, as: :text, input_counter: {type: "word"}
      end
    end

    assert_equal "word", JSON.parse(form.find("textarea")["data-aa-input-counter"])["type"]
  end
end
