require "test_helper"

module TabsTest
  class DefaultTabsTest < ActiveAdminTest
    def default_css_classes
      @default_css_classes ||= ActiveAdminBootstrap::Configs::DEFAULTS.dig(:css_classes, :tabs)
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
          <li class="nav-item">
            <a class="nav-link active" data-bs-toggle="tab" data-bs-target="#tab-1" href="#tab-1">tab-1</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-bs-toggle="tab" data-bs-target="#tab-2" href="#tab-2">tab-2</a>
          </li>
        HTML
      assert_html html, @nav.content
    end
  end

  class HttpTabsTest < ActiveAdminTest
    class HttpTabsView < ::ActiveAdmin::IntegrationTestHelper::MockActionView
      def url_for(*args)
        options = args.extract_options!
        tab = options.delete(:tab)

        if tab.present?
          "https://example.com?tab=#{tab}"
        else
          super
        end
      end
    end

    setup do
      @component = render_arbre_component({}, mock_action_view(HttpTabsView)) do
        tabs(http: true) do
          tab "tab-1"
          tab "tab-2"
        end
      end

      @nav = @component.find_by_class("nav").first
    end

    test "nav #content" do
      html =
        <<~ERB
          <li class="nav-item">
            <a class="nav-link active" href="https://example.com?tab=tab-1">tab-1</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="https://example.com?tab=tab-2">tab-2</a>
          </li>
        ERB
      assert_html html, @nav.content
    end
  end
end
