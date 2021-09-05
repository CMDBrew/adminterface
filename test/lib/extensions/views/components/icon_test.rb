require "test_case/active_admin/base_test_case"

class IconTest < ActiveAdmin::BaseTestCase
  def default_css_classes
    @default_css_classes ||= Adminterface::Configs::DEFAULTS.dig(:css_classes, :icon)
  end

  setup do
    @component = render_arbre_component do
      aa_icon("icon-test")
    end
  end

  test "#tag_name" do
    assert_equal "i", @component.tag_name.to_s
  end

  test "#class_list" do
    assert_equal "aa-icon #{default_css_classes} icon-test", @component.class_list.to_a.join(" ")
  end

  test "#component" do
    html =
      <<~ERB
        <i class="aa-icon #{default_css_classes} icon-test"></i>
      ERB
    assert_html html, @component
  end
end
