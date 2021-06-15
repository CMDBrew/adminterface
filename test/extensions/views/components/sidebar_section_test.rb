require "test_helper"

class SidebarSectionTest < ActiveAdminTest
  def default_css_classes
    @default_css_classes ||= ActiveAdminBootstrap::Configs::DEFAULTS.dig(:css_classes, :sidebar_section)
  end

  setup do
    @component = render_arbre_component do
      section =
        ActiveAdmin::SidebarSection.new(:help) do
          h1 "test"
          para "this is a sidebar_section"
        end

      sidebar_section(section)
    end
  end

  test "#tag_name" do
    assert_equal "div", @component.tag_name
  end

  test "#id" do
    assert_equal "help_sidebar_section", @component.id
  end

  test "#class_list" do
    assert @component.class_list.include?("panel")

    default_css_classes[:wrapper].split.each do |klass|
      assert @component.class_list.include?(klass)
    end
  end

  test "#content" do
    html =
      <<~ERB
        <div class="panel-header #{default_css_classes[:header]}">
          <div class="title">
            <h5>Help</h5>
          </div>
        </div>
        <div class="panel-body #{default_css_classes[:body]}">
          <h1>test</h1>
          <p>this is a sidebar_section</p>
        </div>
      ERB
    assert_html html, @component.content
  end
end
