require "test_case/active_admin/base_test_case"

class IndexAsTableTest < ActiveAdmin::BaseTestCase
  class IndexAsTableController < ActionView::TestCase::TestController
    def action_methods
      %w[show edit destroy]
    end
  end

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

    alias_method :resource_path, :url_for
    alias_method :edit_resource_path, :url_for

    def authorized?(*_args)
      true
    end
  end

  def mock_action_view(base = MockActionView)
    controller = IndexAsTableController.new
    # this line needed because of rails bug https://github.com/rails/rails/commit/d8e98897b5703ac49bf0764da71a06d64ecda9b0
    controller.params = ActionController::Parameters.new
    base.new(view_paths, {}, controller)
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
                  <div class="table_actions #{default_css_classes.dig(:actions, :group)}">
                    <a class="view_link member_link #{default_css_classes.dig(:actions, :item)}" title="View" href="/fake/path">View</a>
                    <a class="edit_link member_link #{default_css_classes.dig(:actions, :item)}" title="Edit" href="/fake/path">Edit</a>
                    <a class="delete_link member_link #{default_css_classes.dig(:actions, :item)}" title="Delete" data-confirm="#{I18n.t(:delete_confirmation, scope: "active_admin")}" rel="nofollow" data-method="delete" href="/fake/path">Delete</a>
                  </div>
                </td>
              </tr>
              <tr class="even" id="open_struct_2">
                <td class="col col-id">2</td>
                <td class="col col-name">mary</td>
                <td class="col col-actions">
                  <div class="table_actions #{default_css_classes.dig(:actions, :group)}">
                    <a class="view_link member_link #{default_css_classes.dig(:actions, :item)}" title="View" href="/fake/path">View</a>
                    <a class="edit_link member_link #{default_css_classes.dig(:actions, :item)}" title="Edit" href="/fake/path">Edit</a>
                    <a class="delete_link member_link #{default_css_classes.dig(:actions, :item)}" title="Delete" data-confirm="#{I18n.t(:delete_confirmation, scope: "active_admin")}" rel="nofollow" data-method="delete" href="/fake/path">Delete</a>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      ERB
    assert_html html, @component.content
  end
end
