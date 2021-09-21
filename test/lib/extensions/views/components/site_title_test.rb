require "test_case/active_admin/base_test_case"

module SiteTitleTest
  module LoggedIn
    class DefaultTest < ActiveAdmin::BaseTestCase
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

    class WithLinkTest < ActiveAdmin::BaseTestCase
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

    class WithImageTest < ActiveAdmin::BaseTestCase
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
            </div>
          HTML
        assert_html html, @component.content
      end
    end
  end

  module LoggedOut
    class DefaultTest < ActiveAdmin::BaseTestCase
      setup do
        namespace = stub_namespace(site_title: "Hello World", site_title_image: nil, site_title_link: nil)

        @component =
          render_arbre_component({namespace: namespace}, mock_action_view) do
            insert_tag ::ActiveAdmin::Views::SiteTitle, assigns[:namespace], false
          end
      end

      test "#tag_name" do
        assert_equal "div", @component.tag_name.to_s
      end

      test "#class_list" do
        refute @component.class_list.include?("navbar-brand")
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

    class WithLinkTest < ActiveAdmin::BaseTestCase
      setup do
        namespace =
          stub_namespace(site_title: "Hello World", site_title_image: nil, site_title_link: "https://www.example.com")

        @component =
          render_arbre_component({namespace: namespace}, mock_action_view) do
            insert_tag ::ActiveAdmin::Views::SiteTitle, assigns[:namespace], false
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

    class WithImageTest < ActiveAdmin::BaseTestCase
      setup do
        namespace =
          stub_namespace(
            site_title: "Hello World",
            site_title_image: "https://www.example.com/assets/logged_in.png",
            site_title_link: nil
          )

        @component =
          render_arbre_component({namespace: namespace}, mock_action_view) do
            insert_tag ::ActiveAdmin::Views::SiteTitle, assigns[:namespace], false
          end
      end

      test "fallbacks to logged_in image" do
        html =
          <<~HTML
            <div class="title">
              <img class="image" alt="Hello World" src="https://www.example.com/assets/logged_in.png" />
            </div>
          HTML
        assert_html html, @component.content
      end
    end
  end
end
