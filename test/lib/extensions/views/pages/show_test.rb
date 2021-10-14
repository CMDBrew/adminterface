require "test_helper"

module ShowPageTest
  class ShowPageView < ::ActiveAdmin::IntegrationTestHelper::MockActionView
    def resource
      User.new
    end

    def active_admin_namespace
      @active_admin_namespace ||= active_admin_application.namespace(:admin)
    end

    def params
      @params ||= ActionController::Parameters.new(controller: "admin/users", action: "show")
    end

    def current_menu
      active_admin_config.navigation_menu
    end

    def authorized?(_action, _subject = nil)
      true
    end

    def collection_path
      "fake/path"
    end

    def url_for(*_args)
      "fake/path"
    end

    def active_admin_config
      @active_admin_config ||=
        active_admin_namespace.register(User) do
          show do
            attributes_table do
              row :name
            end
          end
        end
    end
  end

  class BaseTest < ActiveAdmin::BaseTestCase
    def default_css_classes
      @default_css_classes ||= Adminterface::Configs::DEFAULTS.dig(:css_classes, :html)
    end

    setup do
      page = render_arbre_component({}, mock_action_view(ShowPageView)) do
        insert_tag ActiveAdmin::Views::Pages::Show
      end.to_s

      @page = Capybara.string(page)
    end

    test "container class" do
      assert_equal default_css_classes.dig(:container, :show), @page.find("#main > div")[:class]
    end
  end

  class CommentsTest < ActiveAdmin::BaseTestCase
    class Authorization
      class Comments < Array
        def per(...)
          self
        end

        def total_count
          count
        end

        def total_pages
          1
        end

        def current_page
          1
        end

        def limit_value
          1
        end

        def entry_name(...)
          "comments"
        end
      end

      def scope_collection(...)
        Comments[ActiveAdmin::Comment.new(id: 1, namespace: "admin", resource: User.first, author: User.first, body: "test")]
      end
    end

    class ShowPageCommentsView < ShowPageView
      def active_admin_authorization
        Authorization.new
      end
    end

    def comments_css_classes
      @default_css_classes ||= Adminterface::Configs::DEFAULTS.dig(:css_classes, :comments)
    end

    setup do
      page = render_arbre_component({}, mock_action_view(ShowPageCommentsView)) do
        insert_tag(ActiveAdmin::Views::Pages::Show) do
          active_admin_comments
        end
      end.to_s

      @page = Capybara.string(page)
    end

    test "container class" do
      assert_array_includes(comments_css_classes.dig(:wrapper).split, @page.find(".comments")[:class].split)
      assert_array_includes(comments_css_classes.dig(:body).split, @page.find(".comments .panel-body")[:class].split)
      assert_array_includes(comments_css_classes.dig(:header, :wrapper).split, @page.find(".comments .panel-header")[:class].split)
      assert_array_includes(comments_css_classes.dig(:header, :title).split, @page.find(".comments .panel-header .title")[:class].split)
    end

    test "collection class" do
      assert_array_includes(comments_css_classes.dig(:item, :group)&.split || [], @page.find(".active_admin_comments_collection")[:class].split)
    end

    test "item classes" do
      item_classes = comments_css_classes[:item]
      comment = @page.all(".comments .active_admin_comment:not(.formtastic)").first
      assert_array_includes(item_classes[:wrapper]&.split || [], comment[:class].split)
      assert_array_includes(item_classes[:body]&.split || [], comment.find(".active_admin_comment_body")[:class].split)
      assert_array_includes(item_classes.dig(:header, :wrapper)&.split || [], comment.find(".active_admin_comment_header")[:class].split)
      assert_array_includes(item_classes.dig(:header, :meta)&.split || [], comment.find(".active_admin_comment_meta")[:class].split)
      assert_array_includes(item_classes.dig(:header, :author)&.split || [], comment.find(".active_admin_comment_author")[:class].split)
    end
  end
end
