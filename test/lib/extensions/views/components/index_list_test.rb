require "test_case/active_admin/base_test_case"

class IndexListTest < ActiveAdmin::BaseTestCase
  class IndexListResource < ActiveAdmin::Resource; end

  class IndexListView < ::ActiveAdmin::IntegrationTestHelper::MockActionView
    def url_for(*_args)
      "fake/path"
    end

    def active_admin_config
      @active_admin_config ||=
        IndexListTest::IndexListResource.new(
          active_admin_application.namespace(:admin),
          User
        )
    end
  end

  def default_css_classes
    @default_css_classes ||= Adminterface::Configs::DEFAULTS.dig(:css_classes, :table_tools, :indexes)
  end

  setup do
    @component =
      render_arbre_component({}, mock_action_view(IndexListView)) do
        index_list_renderer [OpenStruct.new(index_name: "my_index")]
      end
  end

  test "#tag_name" do
    assert_equal "div", @component.tag_name.to_s
  end

  test "#class_list" do
    assert @component.class_list.include?("indexes")
    assert @component.class_list.include?("table_tools_segmented_control")
    assert @component.class_list.include?("nav")

    default_css_classes[:tabs].split.each do |klass|
      assert @component.class_list.include?(klass)
    end
  end

  test "#component" do
    html =
      <<~ERB
        <div class="indexes table_tools_segmented_control nav #{default_css_classes[:tabs]}">
          <a href="fake/path" class="index-mode-my_index nav-item nav-link" title="my_index">
            <span>My Index</span>
          </a>
        </div>
      ERB
    assert_html html, @component
  end
end
