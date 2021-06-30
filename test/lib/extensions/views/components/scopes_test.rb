require "test_case/active_admin/base_test_case"

module ScopesTest
  class Base < ActiveAdmin::BaseTestCase
    class ScopesView < ::ActiveAdmin::IntegrationTestHelper::MockActionView
      def active_admin_config
        @active_admin_config ||= active_admin_application.namespace(:admin).register(User)
      end

      def url_for(*args)
        options = args.extract_options!
        scope = options.delete(:scope)

        if scope.present?
          "https://example.com?scope=#{scope}"
        else
          super
        end
      end
    end

    def application
      @application ||= ActiveAdmin::Application.new
    end

    def namespace
      @namespace ||= ActiveAdmin::Namespace.new(application, :admin)
    end

    def default_css_classes
      @default_css_classes ||= ActiveAdminBootstrap::Configs::DEFAULTS.dig(:css_classes, :table_tools, :scopes)
    end
  end

  class DefaultTest < Base
    setup do
      @component =
        render_arbre_component({namespace: namespace}, mock_action_view(ScopesView)) do
          scopes_renderer [
            ActiveAdmin::Scope.new(:all, nil, default: true),
            ActiveAdmin::Scope.new(:published, nil, group: :status),
            ActiveAdmin::Scope.new(:unpublished, nil, group: :status, show_count: true) { User.all }
          ]
        end
    end

    test "#tag_name" do
      assert_equal "div", @component.tag_name.to_s
    end

    test "#class_list" do
      assert @component.class_list.include?("scopes")
    end

    test "#content" do
      html =
        <<~ERB
          <ul class="table_tools_segmented_control scope-default-group nav #{default_css_classes[:tabs]}">
            <li class="scope all nav-item">
              <a href="https://example.com?scope=all" class="nav-link">
                <span>All</span>
              </a>
            </li>
          </ul>
          <ul class="table_tools_segmented_control scope-group-status nav #{default_css_classes[:tabs]}">
            <li class="scope published nav-item">
              <a href="https://example.com?scope=published" class="nav-link">
                <span>Published</span>
              </a>
            </li>
            <li class="scope unpublished nav-item">
              <a href="https://example.com?scope=unpublished" class="nav-link">
                <span>Unpublished</span>
              </a>
            </li>
          </ul>
        ERB
      assert_html html, @component.content
    end
  end

  class WithCount < Base
    class ScopesWithCount < ActiveAdmin::Views::Scopes
      builder_method :scope_with_count_renderer

      def get_scope_count(scope)
        scope.id.eql?("active") ? 0 : 10
      end

      def call_method_or_exec_proc(block)
        true
      end
    end

    setup do
      @component =
        render_arbre_component({namespace: namespace}, mock_action_view(ScopesView)) do
          scope_with_count_renderer(
            [
              ActiveAdmin::Scope.new(:active, nil, show_count: true),
              ActiveAdmin::Scope.new(:archived, nil, show_count: true)
            ],
            scope_count: true
          )
        end
    end

    test "#content" do
      html =
        <<~ERB
          <ul class="table_tools_segmented_control scope-default-group nav #{default_css_classes[:tabs]}">
            <li class="scope active nav-item">
              <a href="https://example.com?scope=active" class="nav-link">
                <span>Active</span>
                <span class="count #{default_css_classes.dig(:counts, :zero)}">0</span>
              </a>
            </li>
            <li class="scope archived nav-item">
              <a href="https://example.com?scope=archived" class="nav-link">
                <span>Archived</span>
                <span class="count #{default_css_classes.dig(:counts, :positive)}">10</span>
              </a>
            </li>
          </ul>
        ERB
      assert_html html, @component.content
    end
  end
end
