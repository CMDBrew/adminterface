require "test_helper"

module FormPageTest
  class Base < ActiveAdminTest
    class FormPageView < ::ActiveAdmin::IntegrationTestHelper::MockActionView
      def active_admin_config
        @active_admin_config ||=
          active_admin_namespace.resources.find { |x| x.resource_name.param_key.eql?("user") }
      end

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
  end

  class PartialTest < Base
    setup do
      load_resources do
        ActiveAdmin.register(User) do
          form partial: {plain: "plain text form!"}
        end
      end

      @page = render_arbre_component({}, mock_action_view(FormPageView)) do
        insert_tag ActiveAdmin::Views::Pages::Form
      end
    end

    test "body #content" do
      page = Capybara.string(@page.to_s)
      assert page.has_text?("plain text form!")
    end
  end

  class MultipleFormTest < Base
    setup do
      load_resources do
        ActiveAdmin.register(User) do
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

      @page = render_arbre_component({}, mock_action_view(FormPageView)) do
        insert_tag active_admin_application.view_factory["new_page"]
      end
    end

    test "body #content" do
      page = Capybara.string(@page.to_s)
      assert_equal 2, page.all("form").count
    end
  end
end