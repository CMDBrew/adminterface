require "test_helper"

class TitleBarTest < ActiveAdminTest
  class TitleBarView < ::ActiveAdmin::IntegrationTestHelper::MockActionView
    def active_admin_config
      @active_admin_config ||= active_admin_application.namespace(:admin).register(User)
    end
  end

  def application
    @application ||= ActiveAdmin::Application.new
  end

  def namespace
    @namespace ||= ActiveAdmin::Namespace.new(application, :admin)
  end

  def default_css_classes
    @default_css_classes ||= ActiveAdminBootstrap::Configs::DEFAULTS.dig(:css_classes, :title_bar)
  end

  setup do
    @component =
      render_arbre_component({namespace: namespace}, mock_action_view(TitleBarView)) do
        title_bar namespace, "Awesome Title", []
      end
  end

  test "#tag_name" do
    assert_equal "nav", @component.tag_name.to_s
  end

  test "#class_list" do
    assert @component.class_list.include?("navbar")

    default_css_classes.split.each do |klass|
      assert @component.class_list.include?(klass)
    end
  end

  test "#content" do
    html =
      <<~HTML
        <button class="navbar-toggler header-toggler">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-brand site_title">
          <div class="title"></div>
        </div>
        <div id="titlebar_left">
          <ol id="breadcrumb" class="breadcrumb">
            <li class="breadcrumb-item active">Awesome Title</li>
          </ol>
        </div>
      HTML
    assert_html html, @component.content
  end
end
