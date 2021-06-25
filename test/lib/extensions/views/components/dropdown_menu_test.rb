require "test_helper"

class DropDownMenuTest < ActiveAdminTest
  setup do
    @component = render_arbre_component do
      dropdown_menu("test") do
        item "link 1", "#"
        item_divider
        item "link 2", "https://www.example.com", class: "text-danger"
        item_html do
          h1 "hello"
        end
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
        <a class="dropdown-toggle dropdown_menu_button" data-bs-toggle="dropdown" href="#">test</a>
        <ul class="dropdown_menu_list dropdown-menu">
          <li>
            <a class="dropdown-item" href="#">link 1</a>
          </li>
          <li class="dropdown-divider"></li>
          <li>
            <a class="dropdown-item text-danger" href="https://www.example.com">link 2</a>
          </li>
          <li>
            <h1>hello</h1>
          </li>
        </ul>
      ERB
    assert_html html, @component.content
  end
end
