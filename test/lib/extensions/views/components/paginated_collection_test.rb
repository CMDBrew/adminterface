require "test_case/active_admin/base_test_case"

class PaginatedCollectionTest < ActiveAdmin::BaseTestCase
  class PaginatedCollectionResource < ActiveAdmin::Resource; end

  class PaginatedCollectionView < ::ActiveAdmin::IntegrationTestHelper::MockActionView
    def url_for(*_args)
      "fake/path"
    end

    def active_admin_config
      @active_admin_config ||=
        PaginatedCollectionTest::PaginatedCollectionResource.new(
          active_admin_application.namespace(:admin),
          User
        )
    end

    def query_parameters
      {page: 1}
    end

    def path_parameters
      {controller: "admin/users"}
    end
  end

  def default_css_classes
    @default_css_classes ||= ActiveAdminBootstrap::Configs::DEFAULTS.dig(:css_classes, :table_tools, :indexes)
  end

  def collection
    @collection ||= begin
      users = 10.times.map { User.new }
      Kaminari.paginate_array(users).page(1).per(5)
    end
  end

  def paginated_collection(*args)
    render_arbre_component({paginated_collection_args: args}, mock_action_view(PaginatedCollectionView)) do
      paginated_collection(*paginated_collection_args)
    end
  end

  test "has pagination" do
    %i[table grid block block].each do |as|
      component = paginated_collection collection
      html = Capybara.string(component.to_s)
      assert html.has_selector?("#index_footer .pagination")
    end
  end

  test "has download_links" do
    component = paginated_collection collection
    html = Capybara.string(component.to_s)
    assert html.has_selector?("#index_footer .download_links")
  end

  test "#html for config with paginations" do
    component = paginated_collection collection, {per_page: [1, 5]}
    html =
      <<~HTML
        <div class="paginated_collection_contents"></div>
        <div id="index_footer">
          <div class="pagination_per_page">
            <div class="input-group input-group-sm">
              <div class="input-group-prepend">
                <label class="input-group-text">Per page: </label>
              </div>
              <select class="form-select">
                <option value="1">1</option>
                <option value="5" selected="selected">5</option>
              </select>
            </div>
          </div>
          <nav class='paginator'>
            <ul class="pagination">
              <li class="page current active page-item">
                <a class="page-link" href="fake/path">1</a>
              </li>
              <li class="page page-item">
                <a rel="next" class="page-link" href="fake/path">2</a>
              </li>
              <li class="next page-item">
                <a rel="next" class="page-link" href="fake/path">Next &rsaquo;</a>
              </li>
              <li class="last page-item">
                <a class="page-link" href="fake/path">Last &raquo;</a>
              </li>
            </ul>
          </nav>
          <div class="pagination_information">Displaying users <b>1&nbsp;-&nbsp;5</b> of <b>10</b> in total</div>
          <div class="download_links">
            <span>Download:</span>
            <a href="fake/path">CSV</a>
            <a href="fake/path">XML</a>
            <a href="fake/path">JSON</a>
          </div>
        </div>
      HTML

    assert_html html, component.content
  end
end
