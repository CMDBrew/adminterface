require "test_case/active_admin/base_test_case"

class IndexPageTest < ActiveAdmin::BaseTestCase
  class IndexPageView < ::ActiveAdmin::IntegrationTestHelper::MockActionView
    def active_admin_config
      @active_admin_config ||=
        active_admin_namespace.resources.find { |x| x.resource_name.param_key.eql?("user") }
    end

    def active_admin_namespace
      @active_admin_namespace ||= active_admin_application.namespace(:admin)
    end

    def params
      @params ||= ActionController::Parameters.new(controller: "admin/users", action: "index")
    end

    def current_menu
      active_admin_config.navigation_menu
    end

    def authorized?(_action, _subject = nil)
      true
    end

    def collection
      []
    end

    def collection_path
      "fake/path"
    end
  end

  def search
    @search ||= User.ransack(name_equals: "john")
  end

  def render
    render_arbre_component({search: search}, mock_action_view(IndexPageView)) do
      insert_tag ActiveAdmin::Views::Pages::Index
    end
  end

  test "raise error if invalid" do
    load_resources do
      ActiveAdmin.register(User) do
        config.layouts = {filter: "random"}
      end
    end

    assert_raises(StandardError) { render }
  end

  test "filter aside" do
    load_resources do
      ActiveAdmin.register(User) do
        config.layouts = {filter: "aside"}
      end
    end

    @page = render
    body = Capybara.string(@page.find_by_tag("body").first.to_s)
    assert body.has_selector?("#aside-filters")
    assert body.has_selector?("#aside-filters-toggler")
  end

  test "filter table_tools" do
    load_resources do
      ActiveAdmin.application.batch_actions = true

      ActiveAdmin.register(User) do
        config.layouts = {filter: "table_tools"}
      end
    end

    @page = render
    body = Capybara.string(@page.find_by_tag("body").first.to_s)
    assert body.has_selector?("#table-tools-filters")
    assert body.has_selector?("#table-tools-filters-toggler")
  end
end
