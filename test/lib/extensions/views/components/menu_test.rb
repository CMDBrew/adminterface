require "test_helper"

module MenuTest
  class Base < ActiveAdmin::BaseTestCase
    def menu
      @menu ||= ActiveAdmin::Menu.new
    end

    def assigns
      @assigns ||= {active_admin_menu: menu}
    end

    def menu_component
      @menu_component ||=
        arbre(assigns, mock_action_view) do
          insert_tag(ActiveAdmin::Views::Menu, active_admin_menu)
        end.children.first
    end
  end

  class DefaultTest < Base
    setup do
      menu.add label: "Reports", url: "/admin/reports" do |m|
        m.add label: "A Sub Reports", url: "/admin/a-sub-reports"
        m.add label: "B Sub Reports", url: "/admin/b-sub-reports"
      end
    end

    test "#content" do
      html =
        <<~HTML
          <ul>
            <li class="nav-item has_nested dropdown" id="reports">
              <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="/admin/reports">Reports</a>
              <ul class="dropdown-menu">
                <li class="dropdown-item" id="a_sub_reports">
                  <a href="/admin/a-sub-reports">A Sub Reports</a>
                </li>
                <li class="dropdown-item" id="b_sub_reports">
                  <a href="/admin/b-sub-reports">B Sub Reports</a>
                </li>
              </ul>
            </li>
          </ul>
        HTML
      assert_html html, menu_component
    end
  end

  class WithPriorityTest < Base
    setup do
      menu.add label: "Reports", url: "/admin/reports" do |m|
        m.add label: "A Sub Reports", url: "/admin/a-sub-reports", priority: 2
        m.add label: "B Sub Reports", url: "/admin/b-sub-reports", priority: 1
      end
    end

    test "#content" do
      html =
        <<~HTML
          <ul>
            <li class="nav-item has_nested dropdown" id="reports">
              <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="/admin/reports">Reports</a>
              <ul class="dropdown-menu">
                <li class="dropdown-item" id="b_sub_reports">
                  <a href="/admin/b-sub-reports">B Sub Reports</a>
                </li>
                <li class="dropdown-item" id="a_sub_reports">
                  <a href="/admin/a-sub-reports">A Sub Reports</a>
                </li>
              </ul>
            </li>
          </ul>
        HTML
      assert_html html, menu_component
    end
  end

  class WithIconTest < Base
    def icons_css_classes
      @icons_css_classes ||= Adminterface::Configs::DEFAULTS.dig(:css_classes, :icon)
    end

    setup do
      menu.add label: "Reports", url: "/admin/reports", icon: "icon-main" do |m|
        m.add label: "A Sub Reports", url: "/admin/a-sub-reports", icon: "icon-sub"
      end
    end

    test "#content" do
      html =
        <<~ERB
          <ul>
            <li class="nav-item has_nested dropdown" id="reports">
              <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="/admin/reports">
                <i class="aa-icon #{icons_css_classes} icon-main"></i>
                <span>Reports</span>
              </a>
              <ul class="dropdown-menu">
                <li class="dropdown-item" id="a_sub_reports">
                  <a href="/admin/a-sub-reports">
                    <i class="aa-icon #{icons_css_classes} icon-sub"></i>
                    <span>A Sub Reports</span>
                  </a>
                </li>
              </ul>
            </li>
          </ul>
        ERB
      assert_html html, menu_component
    end
  end
end
