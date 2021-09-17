require "test_case/active_admin/input_test_case"

module PasswordInputScenarios
  extend ActiveSupport::Concern

  def find_wrapper(form)
    @wrapper ||= form.find(".input.password")
  end

  included do
    test "wrapper" do
      assert find_wrapper(@form).present?
    end

    test "label" do
      assert find_wrapper(@form)
        .has_selector?('label.form-label[for="active_admin_input_test_case_form_object_secret"]')
    end

    test "input" do
      assert find_wrapper(@form).has_selector?(
        'input.form-control[type="password"]'\
          '[id="active_admin_input_test_case_form_object_secret"]'\
          '[name="active_admin_input_test_case_form_object[secret]"]'
      )
    end
  end
end

class PasswordInputTest < ActiveAdmin::InputTestCase
  include PasswordInputScenarios

  setup do
    @form = build_form do |f|
      f.inputs do
        f.input :secret, as: :password
      end
    end
  end
end

class PasswordInputGroupingTest < ActiveAdmin::InputTestCase
  test "renders prepend" do
    form = build_form do |f|
      f.inputs do
        f.input :secret, as: :password, prepend: content_tag(:span, "prepend text", class: "input-group-text")
      end
    end

    assert form.has_selector?('.input-group span.input-group-text + input.form-control[type="password"]')
  end

  test "renders append" do
    form = build_form do |f|
      f.inputs do
        f.input :secret, as: :password, append: content_tag(:span, "append text", class: "input-group-text")
      end
    end

    assert form.has_selector?('.input-group input.form-control[type="password"] + span.input-group-text')
  end
end

class PasswordInputShowPasswordTest < ActiveAdmin::InputTestCase
  test "renders visibility" do
    form = build_form do |f|
      f.inputs do
        f.input :secret, as: :password, password_visibility: true
      end
    end

    assert form.has_selector?(".password.input .password-visibility-toggler")
    assert form.has_selector?(".password.input .password-visibility-toggler i[data-mode='show']")
    assert form.has_selector?(".password.input .password-visibility-toggler i[data-mode='hide']")
  end
end
