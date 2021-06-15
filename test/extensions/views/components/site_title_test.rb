require "test_helper"

module SiteTitleTest
  class DefaultTest < ActiveAdminTest
    setup do
      namespace =
        stub_namespace(site_title: "Hello World", site_title_image: nil, site_title_link: nil)

      @component =
        render_arbre_component({namespace: namespace}, mock_action_view) do
          insert_tag ::ActiveAdmin::Views::SiteTitle, assigns[:namespace]
        end
    end

    test "#tag_name" do
      assert_equal "div", @component.tag_name.to_s
    end

    test "#class_list" do
      assert @component.class_list.include?("navbar-brand")
      assert @component.class_list.include?("site_title")
    end

    test "#content" do
      html =
        <<~HTML
          <div class="title">Hello World</div>
        HTML
      assert_html html, @component.content
    end
  end

  class WithLinkTest < ActiveAdminTest
    setup do
      namespace = stub_namespace(site_title: "Hello World", site_title_image: nil, site_title_link: "https://www.example.com")

      @component =
        render_arbre_component({namespace: namespace}, mock_action_view) do
          insert_tag ::ActiveAdmin::Views::SiteTitle, assigns[:namespace]
        end
    end

    test "#content" do
      html =
        <<~HTML
          <div class="title">
            <a href="https://www.example.com">Hello World</a>
          </div>
        HTML
      assert_html html, @component.content
    end
  end

  class WithImageTest < ActiveAdminTest
    setup do
      namespace =
        stub_namespace(
          site_title: "Hello World",
          site_title_image: "https://www.example.com/assets/image.png",
          site_title_link: nil
        )

      @component =
        render_arbre_component({namespace: namespace}, mock_action_view) do
          insert_tag ::ActiveAdmin::Views::SiteTitle, assigns[:namespace]
        end
    end

    test "#content" do
      html =
        <<~HTML
          <div class="title">
            <img class="image" alt="Hello World" src="https://www.example.com/assets/image.png" />
            <span>Hello World</span>
          </div>
        HTML
      assert_html html, @component.content
    end
  end
end
