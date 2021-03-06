require "test_helper"

module FormPageTest
  class FormPageView < ::ActiveAdmin::IntegrationTestHelper::MockActionView
    def resource
      User.new
    end

    def active_admin_namespace
      @active_admin_namespace ||= active_admin_application.namespace(:admin)
    end

    def params
      @params ||= ActionController::Parameters.new(controller: "admin/users", action: "edit")
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
  end

  class BaseTest < ActiveAdmin::BaseTestCase
    class BaseView < FormPageView
      def active_admin_config
        @active_admin_config ||=
          active_admin_namespace.register(User) do
            form do |f|
              f.inputs do
                f.input :name
              end

              f.actions
            end
          end
      end
    end

    def default_css_classes
      @default_css_classes ||= Adminterface::Configs::DEFAULTS.dig(:css_classes, :html)
    end

    setup do
      page = render_arbre_component({}, mock_action_view(BaseView)) do
        insert_tag ActiveAdmin::Views::Pages::Form
      end.to_s

      @page = Capybara.string(page)
    end

    test "container class" do
      assert_equal default_css_classes.dig(:container, :form), @page.find("#main > div")[:class]
    end
  end

  class PartialTest < ActiveAdmin::BaseTestCase
    class PartialView < FormPageView
      def active_admin_config
        @active_admin_config ||=
          active_admin_namespace.register(User) do
            form partial: {plain: "plain text form!"}
          end
      end
    end

    setup do
      @page = render_arbre_component({}, mock_action_view(PartialView)) do
        insert_tag ActiveAdmin::Views::Pages::Form
      end
    end

    test "body #content" do
      page = Capybara.string(@page.to_s)
      assert page.has_text?("plain text form!")
    end
  end

  class MultipleFormTest < ActiveAdmin::BaseTestCase
    class MultipleFormView < FormPageView
      def active_admin_config
        @active_admin_config ||=
          active_admin_namespace.register(User) do
            form multiple: true do
              form_section [:admin, resource] do |f|
                f.input :name
              end

              form_section [:admin, resource] do |f|
                f.input :name
              end
            end
          end
      end
    end

    setup do
      @page = render_arbre_component({}, mock_action_view(MultipleFormView)) do
        insert_tag ActiveAdmin::Views::Pages::Form
      end
    end

    test "body #content" do
      page = Capybara.string(@page.to_s)
      assert_equal 2, page.all("form").count
    end
  end

  class HasManyFormTest < ActiveAdmin::BaseTestCase
    class HasManyFormView < FormPageView
      def active_admin_config
        @active_admin_config ||=
          active_admin_namespace.register(User) do
            form do |f|
              f.object.user_addresses.new
              f.has_many :user_addresses, allow_destroy: true, sortable: :position, sortable_start: 1 do |k|
                k.inputs do
                  k.input :fullname
                end
              end
            end
          end
      end
    end

    setup do
      @page = render_arbre_component({}, mock_action_view(HasManyFormView)) do
        insert_tag ActiveAdmin::Views::Pages::Form
      end
    end

    test "body #content" do
      page = Capybara.string(@page.to_s)
      has_many_content = page.find("div.has_many_container.user_addresses")
      assert has_many_content.has_selector?("li.handle")
      assert has_many_content.has_selector?("li.has-many-inputs fieldset.inputs")
      assert has_many_content.has_selector?("ol.has-many-actions")
      assert has_many_content.has_selector?(".has-many-list")
    end
  end
end
