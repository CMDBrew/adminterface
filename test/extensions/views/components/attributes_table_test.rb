require "test_helper"

class AttributesTableTest < ActiveAdminTest
  def default_css_classes
    @default_css_classes ||= ActiveAdminBootstrap::Configs::DEFAULTS.dig(:css_classes, :attributes_table)
  end

  setup do
    @component = render_arbre_component do
      attributes_table_for(OpenStruct.new(id: 1, name: "john")) do
        row(:id)
        row(:name)
      end
    end
  end

  test "#tag_name" do
    assert_equal "div", @component.tag_name
  end

  test "#class_list" do
    assert @component.class_list.include?("attributes_table")

    default_css_classes[:wrapper].split.each do |klass|
      assert @component.class_list.include?(klass)
    end
  end

  test "#content" do
    html =
      <<~ERB
        <table border="0" cellspacing="0" cellpadding="0" class="#{default_css_classes[:table]}">
          <tr class="row-id">
            <th>Id</th>
            <td>1</td>
          </tr>
          <tr class="row-name">
            <th>Name</th>
            <td>john</td>
          </tr>
        </table>
      ERB
    assert_html html, @component.content
  end
end
