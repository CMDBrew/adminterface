require "test_case/active_admin/input_test_case"

module DatalistInputScenarios
  extend ActiveSupport::Concern

  def find_wrapper(form)
    @wrapper ||= form.find(".input.datalist")
  end

  included do
    test "wrapper" do
      assert find_wrapper(@form).present?
    end

    test "label" do
      assert find_wrapper(@form)
        .has_selector?('label.form-label[for="active_admin_input_test_case_form_object_friend"]')
    end

    test "input" do
      assert find_wrapper(@form).has_selector?(
        'input.form-control[type="text"]'\
          '[id="active_admin_input_test_case_form_object_friend"]'\
          '[name="active_admin_input_test_case_form_object[friend]"]'
      )
    end

    test "datalist" do
      assert find_wrapper(@form)
        .has_selector?('datalist[id="active_admin_input_test_case_form_object_friend_datalist"]')
    end
  end
end

class DatalistInputTest < ActiveAdmin::InputTestCase
  include DatalistInputScenarios

  setup do
    @form = build_form do |f|
      f.inputs do
        f.input :friend, as: :datalist, collection: %w[tom jerry]
      end
    end
  end
end

class DatalistInputGroupingTest < ActiveAdmin::InputTestCase
  test "renders prepend" do
    form = build_form do |f|
      f.inputs do
        f.input :friend, as: :datalist, prepend: content_tag(:span, "prepend text", class: "input-group-text")
      end
    end

    assert form.has_selector?('.input-group span.input-group-text + input.form-control[type="text"]')
  end

  test "renders append" do
    form = build_form do |f|
      f.inputs do
        f.input :friend, as: :datalist, append: content_tag(:span, "append text", class: "input-group-text")
      end
    end

    assert form.has_selector?('.input-group input.form-control[type="text"] + span.input-group-text')
  end
end
