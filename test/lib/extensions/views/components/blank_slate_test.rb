require "test_case/active_admin/base_test_case"

class BlankSlateTest < ActiveAdmin::BaseTestCase
  def default_css_classes
    @default_css_classes ||= ActiveAdminBootstrap::Configs::DEFAULTS.dig(:css_classes, :blank_slate)
  end

  setup do
    @component = render_arbre_component do
      blank_slate("There are no Posts yet. <a href=\"/posts/new\">Create one</a>")
    end
  end

  test "#tag_name" do
    assert_equal "div", @component.tag_name
  end

  test "#class_list" do
    assert_equal "blank_slate_container #{default_css_classes}", @component.class_list.to_a.join(" ")
  end

  test "#content" do
    html =
      <<~HTML
        <span class="blank_slate">
          There are no Posts yet. <a href="/posts/new">Create one</a>
        </span>
      HTML
    assert_html html, @component.content
  end
end
