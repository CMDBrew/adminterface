require "test_case/active_admin/input_test_case"

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
  def counter_config
    @counter_config ||= ActiveAdminBootstrap::Configs::DEFAULTS.dig(:components, :inputs, :text, :counter)
  end

  test "defaults to disable counter" do
    form = build_form do |f|
      f.inputs do
        f.input :biography, as: :text
      end
    end

    refute form.has_selector?(".input.text .input-counter-container")
    refute form.has_selector?(".input.text .input-counter-stats")
    refute form.has_selector?(".input.text .input-counter-char-count")
    refute form.has_selector?(".input.text .input-counter-char-left")
    refute form.has_selector?(".input.text .input-counter-char-limit")
  end

  test "enables counter" do
    form = build_form do |f|
      f.inputs do
        f.input :biography, as: :text, counter: true
      end
    end

    assert_equal(counter_config.to_json, form.find("textarea")["data-aa-input-counter"])
    assert form.has_selector?(".input.text .input-counter-container")
    assert form.has_selector?(".input.text .input-counter-stats")
    assert form.has_selector?(".input.text .input-counter-char-count")
    assert form.has_selector?(".input.text .input-counter-char-left")
    assert form.has_selector?(".input.text .input-counter-char-limit")
  end

  test "disables counter" do
    form = build_form do |f|
      f.inputs do
        f.input :biography, as: :text, counter: false
      end
    end

    refute form.has_selector?(".input.text .input-counter-container")
    refute form.has_selector?(".input.text .input-counter-stats")
    refute form.has_selector?(".input.text .input-counter-char-count")
    refute form.has_selector?(".input.text .input-counter-char-left")
    refute form.has_selector?(".input.text .input-counter-char-limit")
  end

  test "overrides default config" do
    form = build_form do |f|
      f.inputs do
        f.input :biography, as: :text, counter: {type: "word"}
      end
    end

    assert_equal "word", JSON.parse(form.find("textarea")["data-aa-input-counter"])["type"]
  end
end
