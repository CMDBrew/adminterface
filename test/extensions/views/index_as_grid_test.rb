require "test_helper"

class IndexAsGridTest < ActiveAdminTest
  class IndexAsGridResource < ActiveAdmin::Resource
    def batch_actions
      []
    end
  end

  class IndexAsGridView < ::ActiveAdmin::IntegrationTestHelper::MockActionView
    def active_admin_config
      @active_admin_config ||=
        IndexAsGridTest::IndexAsGridResource.new(
          active_admin_application.namespace(:admin),
          User
        )
    end

    def page_presenter
      @page_presenter ||= ActiveAdmin::PagePresenter.new(columns: 2) do |u|
        h1 u.name
      end
    end
  end

  def application
    @application ||= ActiveAdmin::Application.new
  end

  def namespace
    @namespace ||= ActiveAdmin::Namespace.new(application, :admin)
  end

  def default_breakpoints
    @default_breakpoints ||= ActiveAdminBootstrap::Configs::DEFAULTS.dig(:breakpoints, :index_as_grid)
  end

  def default_css_classes
    @default_css_classes ||= ActiveAdminBootstrap::Configs::DEFAULTS.dig(:css_classes, :index_as_grid)
  end

  setup do
    @component =
      render_arbre_component({namespace: namespace}, mock_action_view(IndexAsGridView)) do
        insert_tag(
          ActiveAdmin::Views::IndexAsGrid, page_presenter,
          [OpenStruct.new(id: 1, name: "john"), OpenStruct.new(id: 2, name: "mary")]
        )
      end
  end

  test "#class_list" do
    assert @component.class_list.include?("index_as_grid")
    assert @component.class_list.include?("index")
  end

  test "#content" do
    html =
      <<~ERB
        <div class="index_grid">
          <div class="#{default_css_classes[:group]}">
            <div id="open_struct_1" class="col-#{default_breakpoints}-6 #{default_css_classes[:item]}">
              <h1>john</h1>
            </div>
            <div id="open_struct_2" class="col-#{default_breakpoints}-6 #{default_css_classes[:item]}">
              <h1>mary</h1>
            </div>
          </div>
        </div>
      ERB
    assert_html html, @component.content
  end
end
