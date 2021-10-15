class ActiveAdmin::InputTestCase < ActiveAdmin::BaseTestCase
  class FormView < ::ActiveAdmin::IntegrationTestHelper::MockActionView
    def protect_against_forgery?
      false
    end
  end

  class FormObject < OpenStruct
    extend ActiveModel::Naming
  end

  def helpers
    mock_action_view(FormView)
  end

  def form_html(options = {}, form_object = FormObject.new, &block)
    options = {url: "fake/path"}.merge(options)

    render_arbre_component({form_object: form_object, form_options: options, form_block: block}, helpers) do
      active_admin_form_for(assigns[:form_object], assigns[:form_options], &assigns[:form_block])
    end.to_s
  end

  def build_form(options = {}, form_object = FormObject.new, &block)
    form = form_html(options, form_object, &block)
    Capybara.string(form)
  end
end
