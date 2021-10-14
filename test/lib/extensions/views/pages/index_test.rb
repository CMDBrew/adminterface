require "test_helper"

module IndexPageTest
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

  class Base < ActiveAdmin::BaseTestCase
    def search
      @search ||= User.ransack(name_equals: "john")
    end

    def default_css_classes
      @default_css_classes ||= Adminterface::Configs::DEFAULTS.dig(:css_classes, :html)
    end

    def render(helpers = IndexPageView)
      render_arbre_component({search: search}, mock_action_view(helpers)) do
        insert_tag ActiveAdmin::Views::Pages::Index
      end
    end
  end

  class BaseTest < Base
    setup do
      load_resources do
        ActiveAdmin.register(User) do
          config.components = {filter: {position: "sidebar"}}
        end
      end

      @page = Capybara.string(render.to_s)
    end

    test "container class" do
      assert_equal default_css_classes.dig(:container, :index), @page.find("#main > div")[:class]
    end
  end

  class FiltersTest < Base
    class InvalidPositionView < IndexPageView
      def active_admin_config
        @active_admin_config ||=
          active_admin_namespace.register(User) do
            config.components = {filter: {position: "random"}}
          end
      end
    end

    test "raise error if invalid" do
      assert_raises(StandardError) { render(InvalidPositionView) }
    end

    class AsidePositionView < IndexPageView
      def active_admin_config
        @active_admin_config ||=
          active_admin_namespace.register(User) do
            config.components = {filter: {position: "aside"}}
          end
      end
    end

    test "filter aside" do
      body = Capybara.string(render(AsidePositionView).find_by_tag("body").first.to_s)
      assert body.has_selector?("#filters")
      assert body.has_selector?("#filters-toggler")
    end

    class TableToolsPositionView < IndexPageView
      def active_admin_config
        @active_admin_config ||=
          active_admin_namespace.register(User) do
            config.components = {filter: {position: "table_tools"}}
            config.batch_actions = true
          end
      end
    end

    test "filter table_tools" do
      body = Capybara.string(render(TableToolsPositionView).find_by_tag("body").first.to_s)
      assert body.has_selector?("#filters")
      assert body.has_selector?("#filters-toggler")
    end
  end
end
