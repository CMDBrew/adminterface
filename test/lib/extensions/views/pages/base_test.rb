require "test_case/active_admin/base_test_case"

module BasePageTest
  class PageResource < ActiveAdmin::Page
    module Routes
      def admin_pagetest_path
        "fake/path"
      end
    end
  end

  class PageView < ::ActiveAdmin::IntegrationTestHelper::MockActionView
    def active_admin_config
      @active_admin_config ||= BasePageTest::PageResource.new(active_admin_namespace, "BasePageTest", {})
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

  class DefaultTest < ActiveAdmin::BaseTestCase
    setup do
      @page = render_arbre_component({}, mock_action_view(PageView)) do
        insert_tag ActiveAdmin::Views::Pages::Base
      end

      @body = @page.find_by_tag("body").first
    end

    test "body #class_list" do
      assert @body.class_list.include?("active_admin")
      assert @body.class_list.include?("logged_in")
      assert @body.class_list.find { |x| x.match?(/_namespace/) }
      assert @body.class_list.find { |x| x.match?(/layout-navigation-/) }
    end

    test "body #content" do
      body = Capybara.string(@body.to_s)
      assert body.has_selector?("#header")
      assert body.has_selector?("#title_bar")
      assert body.has_selector?("#wrapper")
      assert body.has_selector?("#active_admin_content")
      assert body.has_selector?("#main_content_wrapper")
      assert body.has_selector?("#main_content")
      assert body.has_selector?("#footer")
    end
  end

  class SidebarOptionsTest < ActiveAdmin::BaseTestCase
    test "invalid sidebar options" do
      assert_raises StandardError do
        @page = render_arbre_component({}, mock_action_view(PageView)) do
          active_admin_config.layouts = {sidebar: "bottom"}
          insert_tag ActiveAdmin::Views::Pages::Base
        end
      end
    end
  end

  class FlashMessagesTest < ActiveAdmin::BaseTestCase
    class PageWithFlashMessages < ActiveAdmin::Views::Pages::Base
      def flash_messages
        {alert: "Alert message", notice: ["First notice message", "Second notice message"]}
      end
    end

    def default_css_classes
      @default_css_classes ||= ActiveAdminBootstrap::Configs::DEFAULTS.dig(:css_classes, :flash)
    end

    test "shows all flash messages" do
      div = PageWithFlashMessages.new.send :build_flash_messages
      html =
        <<~ERB
          <div class="flashes">
            <div class="flash flash_alert #{default_css_classes[:alert]}">Alert message</div>
            <div class="flash flash_notice #{default_css_classes[:notice]}">First notice message</div>
            <div class="flash flash_notice #{default_css_classes[:notice]}">Second notice message</div>
          </div>
        ERB
      assert_html html, div
    end
  end
end
