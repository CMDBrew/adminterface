require "test_helper"

class IndexAsTableTest < ActiveAdminTest
  class IndexAsTableResource < ActiveAdmin::Resource
    def batch_actions
      []
    end
  end

  class IndexAsTableView < ::ActiveAdmin::IntegrationTestHelper::MockActionView
    def active_admin_config
      @active_admin_config ||=
        IndexAsTableTest::IndexAsTableResource.new(
          active_admin_application.namespace(:admin),
          User
        )
    end

    def page_presenter
      @page_presenter ||= ActiveAdmin::PagePresenter.new(columns: 2) do
        column :id
        column :name
        actions(defaults: true)
      end
    end

    def url_for(*_args)
      "/fake/path"
    end
  end

  def application
    @application ||= ActiveAdmin::Application.new
  end

  def namespace
    @namespace ||= ActiveAdmin::Namespace.new(application, :admin)
  end

  def default_css_classes
    @default_css_classes ||= ActiveAdminBootstrap::Configs::DEFAULTS.dig(:css_classes, :index_as_table)
  end

  setup do
    @component =
      render_arbre_component({namespace: namespace}, mock_action_view(IndexAsTableView)) do
        insert_tag(
          ActiveAdmin::Views::IndexAsTable, page_presenter,
          [OpenStruct.new(id: 1, name: "john"), OpenStruct.new(id: 2, name: "mary")]
        )
      end
  end

  test "#class_list" do
    assert @component.class_list.include?("index_as_table")
    assert @component.class_list.include?("index")
  end

  test "#content" do
    html =
      <<~ERB
        <div class="#{default_css_classes[:wrapper]}">
          <table border="0" cellspacing="0" cellpadding="0" id="index_table_users" class="table_for index_table index #{default_css_classes[:table]}" paginator="true">
            <thead>
              <tr>
                <th class="sortable col col-id"><a href="/fake/path">Id</a></th>
                <th class="sortable col col-name"><a href="/fake/path">Name</a></th>
                <th class="col col-actions"></th>
              </tr>
            </thead>
            <tbody>
              <tr class="odd" id="open_struct_1">
                <td class="col col-id">1</td>
                <td class="col col-name">john</td>
                <td class="col col-actions">
                  <div class="table_actions #{default_css_classes.dig(:actions, :group)}"></div>
                </td>
              </tr>
              <tr class="even" id="open_struct_2">
                <td class="col col-id">2</td>
                <td class="col col-name">mary</td>
                <td class="col col-actions">
                  <div class="table_actions #{default_css_classes.dig(:actions, :group)}"></div>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      ERB
    assert_html html, @component.content
  end
end
