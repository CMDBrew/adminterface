require "test_helper"

module AlertHelperTest
  class FlashTest < ActiveAdmin::BaseTestCase
    def flash_css_classes
      @flash_css_classes ||= Adminterface::Configs::DEFAULTS.dig(:css_classes, :flash)
    end

    setup do
      @view = mock_action_view
      @view.output_buffer = ""
    end

    test "#flashes_html" do
      @view.request.flash.now[:alert] = "Alert"
      @view.request.flash.now[:notice] = "Notice"
      @view.flashes_html

      html =
        <<~ERB
          <div class="flash flash_alert alert #{flash_css_classes[:alert]}" role="alert">Alert</div>
          <div class="flash flash_notice alert #{flash_css_classes[:notice]}" role="alert">Notice</div>
        ERB

      assert_html html, @view.output_buffer
    end
  end

  class DeviseTest < ActiveAdmin::BaseTestCase
    class DeviseView < ::ActiveAdmin::IntegrationTestHelper::MockActionView
      def resource
        user = User.new
        user.valid?
        user
      end
    end

    def flash_css_classes
      @flash_css_classes ||= Adminterface::Configs::DEFAULTS.dig(:css_classes, :flash)
    end

    setup do
      @view = mock_action_view(DeviseView)
    end

    test "#error_messages" do
      html = Capybara.string(@view.devise_error_messages!)
      assert html.has_selector?(".alert.#{flash_css_classes[:error]}")
    end
  end
end
