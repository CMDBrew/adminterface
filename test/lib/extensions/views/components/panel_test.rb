require "test_helper"

module PanelTest
  class DefaultTest < ActiveAdmin::BaseTestCase
    def default_css_classes
      @default_css_classes ||= Adminterface::Configs::DEFAULTS.dig(:css_classes, :panel)
    end

    setup do
      @component = render_arbre_component do
        panel "panel title" do
          header_action do
            div class: "btn-group" do
              safe_join [
                link_to("Link A", "/fake/path"),
                link_to("Link B", "/fake/path")
              ]
            end
          end

          h1 "test"
          para "this is a panel"
        end
      end
    end

    test "#tag_name" do
      assert_equal "div", @component.tag_name
    end

    test "#class_list" do
      assert @component.class_list.include?("panel")

      default_css_classes[:wrapper].split.each do |klass|
        assert @component.class_list.include?(klass)
      end
    end

    test "#html" do
      html =
        <<~ERB
          <div class="panel-header #{default_css_classes.dig(:header, :wrapper)}">
            <div class="title #{default_css_classes.dig(:header, :title)}">panel title</div>
            <div class="header_action">
              <div class="btn-group">
                <a href="/fake/path">Link A</a>
                <a href="/fake/path">Link B</a>
              </div>
            </div>
          </div>
          <div class="panel_contents panel-body #{default_css_classes[:body]}">
            <h1>test</h1>
            <p>this is a panel</p>
          </div>
        ERB
      assert_html html, @component.content
    end
  end

  class WithOptionsTest < ActiveAdmin::BaseTestCase
    def default_css_classes
      @default_css_classes ||= Adminterface::Configs::DEFAULTS.dig(:css_classes, :panel)
    end

    setup do
      @component = render_arbre_component do
        panel "", header_html: {class: "header"}, body_html: {class: "body"} do
          h1 "test"
          para "this is a panel"
        end
      end
    end

    test "#content" do
      html =
        <<~ERB
          <div class="panel-header #{default_css_classes.dig(:header, :wrapper)} header"></div>
          <div class="panel_contents panel-body #{default_css_classes[:body]} body">
            <h1>test</h1>
            <p>this is a panel</p>
          </div>
        ERB
      assert_html html, @component.content
    end
  end
end
