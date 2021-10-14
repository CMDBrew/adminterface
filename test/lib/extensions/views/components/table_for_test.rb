require "test_helper"

class TableForTest < ActiveAdmin::BaseTestCase
  def default_css_classes
    @default_css_classes ||= Adminterface::Configs::DEFAULTS.dig(:css_classes, :table_for)
  end

  setup do
    @component = render_arbre_component do
      table_for(OpenStruct.new(id: 1, name: "john")) do
        column(:id)
        column(:name)
      end
    end
  end

  test "#tag_name" do
    assert_equal "table", @component.tag_name
  end

  test "#class_list" do
    assert @component.class_list.include?("table_for")

    default_css_classes.split.each do |klass|
      assert @component.class_list.include?(klass)
    end
  end

  test "#content" do
    html =
      <<~HTML
        <thead>
          <tr>
            <th class="col col-id">Id</th>
            <th class="col col-name">Name</th>
          </tr>
        </thead>
        <tbody>
          <tr class="odd" id="open_struct_1">
            <td class="col col-id">1</td>
            <td class="col col-name">john</td>
          </tr>
        </tbody>
      HTML
    assert_html html, @component.content
  end
end
