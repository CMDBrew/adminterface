require "test_case/active_admin/base_test_case"

class ComponentHelperTest < ActiveAdmin::BaseTestCase
  setup do
    @view = mock_action_view
  end

  test "#site_title" do
    namespace =
      stub_namespace(site_title: "Hello World", site_title_image: nil, site_title_link: nil)
    html = Capybara.string(@view.site_title(namespace))
    assert html.has_selector?(".site_title .title")
  end

  test "#footer" do
    html = Capybara.string(@view.footer(stub_namespace))
    assert html.has_selector?("#footer")
  end
end
