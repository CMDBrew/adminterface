require "test_case/active_admin/base_test_case"

class ShowPageTest < ActiveAdmin::BaseTestCase
  class ShowPageView < ::ActiveAdmin::IntegrationTestHelper::MockActionView
    def resource
      User.new
    end

    def active_admin_namespace
      @active_admin_namespace ||= active_admin_application.namespace(:admin)
    end

    def params
      @params ||= ActionController::Parameters.new(controller: "admin/users", action: "show")
    end

    def current_menu
      active_admin_config.navigation_menu
    end

    def authorized?(_action, _subject = nil)
      true
    end

    def collection_path
      "fake/path"
    end

    def url_for(*_args)
      "fake/path"
    end

    def active_admin_config
      @active_admin_config ||=
        active_admin_namespace.register(User) do
          show do
            attributes_table do
              row :name
            end
          end
        end
    end
  end

  def default_css_classes
    @default_css_classes ||= ActiveAdminBootstrap::Configs::DEFAULTS.dig(:css_classes, :html)
  end

  setup do
    page = render_arbre_component({}, mock_action_view(ShowPageView)) do
      insert_tag ActiveAdmin::Views::Pages::Show
    end.to_s

    @page = Capybara.string(page)
  end

  test "container class" do
    assert_equal default_css_classes.dig(:container, :show), @page.find("#main > div")[:class]
  end
end
