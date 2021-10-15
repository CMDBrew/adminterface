require "test_helper"

class ActiveAdminFormTest < ActiveAdmin::BaseTestCase
  class ActiveAdminFormView < ::ActiveAdmin::IntegrationTestHelper::MockActionView
    def admin_users_path
      "fake/path"
    end

    def url_for(*_args)
      "fake/path"
    end
  end

  def default_css_classes
    @default_css_classes ||= Adminterface::Configs::DEFAULTS.dig(:css_classes, :form)
  end

  setup do
    @component = render_arbre_component({}, mock_action_view(ActiveAdminFormView)) do
      active_admin_form_for [:admin, User.new] do |f|
        f.actions
      end
    end
  end

  test "#component" do
    html =
      <<~ERB
        <form class="formtastic user" id="new_user" novalidate="novalidate" action="fake/path" accept-charset="UTF-8" method="post">
          <fieldset class="actions">
            <ol>
              <li class="action input_action " id="user_submit_action">
                <input type="submit" name="commit" value="Create User" class="#{default_css_classes.dig(:actions, :submit)}" data-disable-with="Create User" />
              </li>
              <li class="cancel">
                <a class="#{default_css_classes.dig(:actions, :cancel)}" href="fake/path">Cancel</a>
              </li>
            </ol>
          </fieldset>
        </form>
      ERB
    assert_html html, @component
  end
end
