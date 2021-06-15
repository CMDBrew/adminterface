require "test_helper"

class ScopesTest < ActiveAdminTest
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

  setup do
    @component =
      render_arbre_component({namespace: namespace}, mock_action_view(ScopesView)) do
        scopes_renderer [
          ActiveAdmin::Scope.new(:all, nil, default: true),
          ActiveAdmin::Scope.new(:published, nil, group: :status),
          ActiveAdmin::Scope.new(:unpublished, nil, group: :status)
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
          <li class="scope nav-item all">
            <a href="https://example.com?scope=all" class="nav-link">
              <span>All</span>
            </a>
          </li>
        </ul>
        <ul class="table_tools_segmented_control scope-group-status nav #{default_css_classes[:tabs]}">
          <li class="scope nav-item published">
            <a href="https://example.com?scope=published" class="nav-link">
              <span>Published</span>
            </a>
          </li>
          <li class="scope nav-item unpublished">
            <a href="https://example.com?scope=unpublished" class="nav-link">
              <span>Unpublished</span>
            </a>
          </li>
        </ul>
      ERB
    assert_html html, @component.content
  end
end
