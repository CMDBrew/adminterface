require "test_helper"

class PageTest < ActiveAdminTest
  class PageResource < ActiveAdmin::Page
    module Routes
      def admin_pagetest_path
        "fake/path"
      end
    end
  end

  class PageView < ::ActiveAdmin::IntegrationTestHelper::MockActionView
    def active_admin_config
      @active_admin_config ||= PageTest::PageResource.new(active_admin_namespace, "PageTest", {})
    end

    def active_admin_namespace
      @active_admin_namespace ||= active_admin_application.namespace(:admin)
    end

    def params
      @params ||= ActionController::Parameters.new(controller: "admin/page_test", action: "index")
    end

    def current_menu
      active_admin_config.navigation_menu
    end

    def authorized?(_action, _subject = nil)
      true
    end
  end

  setup do
    @page = render_arbre_component({}, mock_action_view(PageView)) do
      insert_tag ActiveAdmin::Views::Pages::Page
    end

    @body = @page.find_by_tag("body").first
  end

  test "body #class_list" do
    assert @body.class_list.include?("page")
  end
end
