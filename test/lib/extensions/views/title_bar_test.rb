require "test_helper"

class TitleBarTest < ActiveAdminTest
  class TitleBarView < ::ActiveAdmin::IntegrationTestHelper::MockActionView
    def active_admin_config
      @active_admin_config ||= active_admin_namespace.register(User)
    end

    def active_admin_namespace
      @active_admin_namespace ||= active_admin_application.namespace(:admin)
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

  def action_items_css_classes
    @action_items_css_classes ||= ActiveAdminBootstrap::Configs::DEFAULTS.dig(:css_classes, :action_items)
  end

  setup do
    @component =
      render_arbre_component({namespace: namespace}, mock_action_view(TitleBarView)) do
        title_bar namespace, "Awesome Title", [
          ActiveAdmin::ActionItem.new(:publish, class: "custom_class", group: "status") do
            link_to "publish", "#"
          end,
          ActiveAdmin::ActionItem.new(:publish, class: "custom_class", group: "status") do
            link_to "unpublish", "#"
          end,
          ActiveAdmin::ActionItem.new(:publish, class: "custom_class") do
            link_to "visit", "#"
          end
        ]
      end
  end

  test "#tag_name" do
    assert_equal "nav", @component.tag_name.to_s
  end

  test "#class_list" do
    assert @component.class_list.include?("navbar")

    default_css_classes[:wrapper].split.each do |klass|
      assert @component.class_list.include?(klass)
    end
  end

  test "#content" do
    html =
      <<~ERB
        <div class="#{default_css_classes[:container]}">
          <button class="navbar-toggler header-toggler">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="site_title navbar-brand">
            <div class="title"></div>
          </div>
          <div id="titlebar_left">
            <ol id="breadcrumb" class="breadcrumb">
              <li class="breadcrumb-item active">Awesome Title</li>
            </ol>
          </div>
          <div id="titlebar_right">
            <div class="action_items #{action_items_css_classes[:group]}">
              <a class="#{action_items_css_classes[:item]}" href="#">publish</a>
              <a class="#{action_items_css_classes[:item]}" href="#">unpublish</a>
            </div>
            <div class="action_items #{action_items_css_classes[:group]}">
              <a class="#{action_items_css_classes[:item]}" href="#">visit</a>
            </div>
          </div>
        </div>
      ERB
    assert_html html, @component.content
  end
end
