require "test_case/active_admin/base_test_case"

class StatusTagTest < ActiveAdmin::BaseTestCase
  def default_css_classes
    @default_css_classes ||= Adminterface::Configs::DEFAULTS.dig(:css_classes, :status_tag)
  end

  setup do
    @unset_tag = render_arbre_component do
      status_tag nil
    end

    @yes_tag = render_arbre_component do
      status_tag true
    end

    @no_tag = render_arbre_component do
      status_tag false
    end

    @custom_status_tag = render_arbre_component do
      status_tag :custom
    end

    @custom_class_tag = render_arbre_component do
      status_tag :custom, class: "custom-class"
    end
  end

  test "#tag_name" do
    assert_equal "span", @unset_tag.tag_name
  end

  test "#class_list" do
    assert_equal "status_tag #{default_css_classes[:unset]}", @unset_tag.class_list.to_a.join(" ")
    assert_equal "status_tag #{default_css_classes[:yes]}", @yes_tag.class_list.to_a.join(" ")
    assert_equal "status_tag #{default_css_classes[:no]}", @no_tag.class_list.to_a.join(" ")
    assert_equal "status_tag custom", @custom_status_tag.class_list.to_a.join(" ")
    assert_equal "status_tag custom custom-class", @custom_class_tag.class_list.to_a.join(" ")
  end

  test "#content" do
    assert_html "<span class=\"status_tag #{default_css_classes[:unset]}\">No</span>", @unset_tag
    assert_html "<span class=\"status_tag #{default_css_classes[:yes]}\">Yes</span>", @yes_tag
    assert_html "<span class=\"status_tag #{default_css_classes[:no]}\">No</span>", @no_tag
    assert_html "<span class=\"status_tag custom\">Custom</span>", @custom_status_tag
    assert_html "<span class=\"status_tag custom custom-class\">Custom</span>", @custom_class_tag
  end
end
