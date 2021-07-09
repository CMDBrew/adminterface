require "test_case/active_admin/input_test_case"

module FileInputScenarios
  extend ActiveSupport::Concern

  def find_wrapper(form)
    @wrapper ||= form.find(".input.file")
  end

  included do
    test "wrapper" do
      assert find_wrapper(@form).present?
    end

    test "label" do
      assert find_wrapper(@form)
        .has_selector?('label.form-label[for="active_admin_input_test_case_form_object_image"]')
    end

    test "input" do
      assert find_wrapper(@form).has_selector?(
        'input.form-control[type="file"]'\
          '[id="active_admin_input_test_case_form_object_image"]'\
          '[name="active_admin_input_test_case_form_object[image]"]'
      )
    end
  end
end

class FileInputTest < ActiveAdmin::InputTestCase
  include FileInputScenarios

  setup do
    @form = build_form do |f|
      f.inputs do
        f.input :image, as: :file
      end
    end
  end
end

class FileInputGroupingTest < ActiveAdmin::InputTestCase
  test "renders prepend" do
    form = build_form do |f|
      f.inputs do
        f.input :image, as: :file, prepend: content_tag(:span, "prepend text", class: "input-group-text")
      end
    end

    assert form.has_selector?('.input-group span.input-group-text + input.form-control[type="file"]')
  end

  test "renders append" do
    form = build_form do |f|
      f.inputs do
        f.input :image, as: :file, append: content_tag(:span, "append text", class: "input-group-text")
      end
    end

    assert form.has_selector?('.input-group input.form-control[type="file"] + span.input-group-text')
  end
end
