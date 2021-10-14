require "test_helper"

module UrlInputScenarios
  extend ActiveSupport::Concern

  def find_wrapper(form)
    @wrapper ||= form.find(".input.url")
  end

  included do
    test "wrapper" do
      assert find_wrapper(@form).present?
    end

    test "label" do
      assert find_wrapper(@form)
        .has_selector?('label.form-label[for="active_admin_input_test_case_form_object_website"]')
    end

    test "input" do
      assert find_wrapper(@form).has_selector?(
        'input.form-control[type="url"]'\
          '[id="active_admin_input_test_case_form_object_website"]'\
          '[name="active_admin_input_test_case_form_object[website]"]'
      )
    end
  end
end

class UrlInputTest < ActiveAdmin::InputTestCase
  include UrlInputScenarios

  setup do
    @form = build_form do |f|
      f.inputs do
        f.input :website, as: :url
      end
    end
  end
end

class UrlInputGroupingTest < ActiveAdmin::InputTestCase
  test "renders prepend" do
    form = build_form do |f|
      f.inputs do
        f.input :website, as: :url, prepend: content_tag(:span, "prepend text", class: "input-group-text")
      end
    end

    assert form.has_selector?('.input-group span.input-group-text + input.form-control[type="url"]')
  end

  test "renders append" do
    form = build_form do |f|
      f.inputs do
        f.input :website, as: :url, append: content_tag(:span, "append text", class: "input-group-text")
      end
    end

    assert form.has_selector?('.input-group input.form-control[type="url"] + span.input-group-text')
  end
end
