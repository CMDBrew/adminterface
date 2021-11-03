require "test_helper"

module TabsTest
  class DefaultTabsTest < ActiveAdmin::BaseTestCase
    def default_css_classes
      @default_css_classes ||= Adminterface::Configs::DEFAULTS.dig(:css_classes, :tabs)
    end

    setup do
      @component = render_arbre_component do
        tabs do
          tab "tab-1"
          tab "tab-2"
        end
      end

      @nav = @component.find_by_class("nav").first
    end

    test "#tag_name" do
      assert_equal "div", @component.tag_name
    end

    test "wrapper #class_list" do
      assert @component.class_list.include?("tabs")
    end

    test "nav #class_list" do
      default_css_classes.split.each do |klass|
        assert @nav.class_list.include?(klass)
      end
    end

    test "nav #content" do
      html =
        <<~HTML
          <li class="nav-item" role="presentation">
            <a id="tab-1-tab" aria-controls="tab-1" class="nav-link active" aria-selected="true" data-bs-toggle="tab" data-bs-target="#tab-1" href="#tab-1">tab-1</a>
          </li>
          <li class="nav-item" role="presentation">
            <a id="tab-2-tab" aria-controls="tab-2" class="nav-link" aria-selected="false" data-bs-toggle="tab" data-bs-target="#tab-2" href="#tab-2">tab-2</a>
          </li>
        HTML
      assert_html html, @nav.content
    end
  end

  class TabsOptionsTest < ActiveAdmin::BaseTestCase
    setup do
      @component = render_arbre_component do
        tabs nav_html: {class: "my-tabs-nav"}, content_html: {class: "my-tabs-content"} do
          tab "tab-1"
          tab "tab-2"
        end
      end
    end

    test "#content" do
      html =
        <<~HTML
          <ul class="nav nav-tabs my-tabs-nav" role="tablist">
            <li class="nav-item" role="presentation">
              <a id="tab-1-tab" aria-controls="tab-1" class="nav-link active" aria-selected="true" data-bs-toggle="tab" data-bs-target="#tab-1" href="#tab-1">tab-1</a>
            </li>
            <li class="nav-item" role="presentation">
              <a id="tab-2-tab" aria-controls="tab-2" class="nav-link" aria-selected="false" data-bs-toggle="tab" data-bs-target="#tab-2" href="#tab-2">tab-2</a>
            </li>
          </ul>
          <div class="tab-content my-tabs-content">
            <div id="tab-1" aria-labelledby="tab-1-tab" class="tab-pane active" role="tabpanel"></div>
            <div id="tab-2" aria-labelledby="tab-2-tab" class="tab-pane" role="tabpanel"></div>
          </div>
        HTML
      assert_html html, @component.content
    end
  end

  class HttpTabsTest < ActiveAdmin::BaseTestCase
    class HttpTabsView < ::ActiveAdmin::IntegrationTestHelper::MockActionView
      def url_for(*args)
        options = args.extract_options!
        options.delete(:controller)
        options.delete(:action)
        anchor = options[:anchor].present? ? "##{options.delete(:anchor)}" : ""

        if options[:tab].present?
          "https://example.com?#{options.to_query}#{anchor}"
        else
          super
        end
      end
    end

    setup do
      @component = render_arbre_component({}, mock_action_view(HttpTabsView)) do
        tabs(http: true, id: "my-tabs") do
          tab "tab-1"
          tab "tab-2"
        end
      end

      @nav = @component.find_by_class("nav").first
    end

    test "nav #content" do
      html =
        <<~ERB
          <li class="nav-item" role="presentation">
            <a id="tab-1-tab" aria-controls="tab-1" class="nav-link active" aria-selected="true" href="https://example.com?anchor_id=my-tabs&tab=tab-1#my-tabs">tab-1</a>
          </li>
          <li class="nav-item" role="presentation">
            <a id="tab-2-tab" aria-controls="tab-2" class="nav-link" aria-selected="false" href="https://example.com?anchor_id=my-tabs&tab=tab-2#my-tabs">tab-2</a>
          </li>
        ERB
      assert_html html, @nav.content.gsub("&amp\;", "&")
    end
  end
end
