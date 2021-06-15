require "test_helper"

class IndexListTest < ActiveAdminTest
  def default_css_classes
    @default_css_classes ||= ActiveAdminBootstrap::Configs::DEFAULTS.dig(:css_classes, :table_tools, :indexes)
  end

  setup do
    @component =
      render_arbre_component do
        index_list_renderer []
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
        <div class="indexes table_tools_segmented_control nav #{default_css_classes[:tabs]}"></div>
      ERB
    assert_html html, @component
  end
end
