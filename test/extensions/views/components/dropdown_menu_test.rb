require "test_helper"

class DropDownMenuTest < ActiveAdminTest
  setup do
    @component = render_arbre_component do
      dropdown_menu("test") do
        item "link 1", "#"
        item_divider
        item "link 2", "https://www.example.com", class: "text-danger"
      end
    end
  end

  test "#tag_name" do
    assert_equal "div", @component.tag_name
  end

  test "#class_list" do
    assert @component.class_list.include?("dropdown")
  end

  test "#content" do
    html =
      <<~ERB
        <a class=" dropdown-toggle dropdown_menu_button" data-toggle="dropdown" href="#">test</a>
        <div class="dropdown_menu_list_wrapper">
          <ul class=" dropdown-menu dropdown_menu_list">
            <li><a class="dropdown-item" href="#">link 1</a></li>
            <li class="dropdown-divider"></li>
            <li><a class="dropdown-item text-danger" href="https://www.example.com">link 2</a></li>
          </ul>
        </div>
      ERB
    assert_html html, @component.content
  end
end
