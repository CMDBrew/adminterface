require "test_helper"

module ConfigurationsTest
  class Base < ActiveSupport::TestCase
    setup do
      @application = ActiveAdmin::Application.new
      @configs = ActiveAdminBootstrap::Configs::DEFAULTS
    end
  end

  class DefaultTest < Base
    test "default components" do
      assert_equal @configs[:components], @application.components
    end

    test "default css_classes" do
      assert_equal @configs[:css_classes], @application.css_classes
    end
  end

  class GlobalTest < Base
    setup do
      @application.components = {
        active_admin_comments: {input: "string"},
        action_items: {new: {icon_class: "fake_icon"}, destroy: {only: %w[show edit]}}
      }
      @application.css_classes = {header: "navbar-light bg-light"}
    end

    test "updates components" do
      assert_equal({input: "string"}, @application.components[:active_admin_comments].deep_symbolize_keys)
      assert_equal(
        {
          new: {only: %w[index], icon_class: "fake_icon", css_class: "btn btn-primary"},
          edit: {only: %w[show], icon_class: nil, css_class: nil},
          destroy: {only: %w[show edit], icon_class: nil, css_class: nil}
        },
        @application.components[:action_items].deep_symbolize_keys
      )
    end

    test "updates css_classes" do
      assert_equal "navbar-light bg-light", @application.css_classes[:header]
    end
  end

  class NamespaceTest < Base
    setup do
      @namespace = ActiveAdmin::Namespace.new(@application, :super_admin)
      @namespace.components = {
        active_admin_comments: {input: "string"},
        action_items: {new: {icon_class: "fake_icon"}, destroy: {only: %w[show edit]}}
      }
      @namespace.css_classes = {header: "navbar-light bg-light"}
    end

    test "does not equal the gloabl configs" do
      assert_not_equal @application.components, @namespace.components
      assert_not_equal @application.css_classes, @namespace.css_classes
    end

    test "updates components" do
      assert_equal({input: "string"}, @namespace.components[:active_admin_comments].deep_symbolize_keys)
      assert_equal(
        {
          new: {only: %w[index], icon_class: "fake_icon", css_class: "btn btn-primary"},
          edit: {only: %w[show], icon_class: nil, css_class: nil},
          destroy: {only: %w[show edit], icon_class: nil, css_class: nil}
        },
        @namespace.components[:action_items].deep_symbolize_keys
      )
    end

    test "updates css_classes" do
      assert_equal "navbar-light bg-light", @namespace.css_classes[:header]
    end
  end

  class ResourceTest < Base
    setup do
      @namespace = ActiveAdmin::Namespace.new(@application, :admin)
      @resource =
        @namespace.register(User) do
          config.components = {
            active_admin_comments: {input: "string"},
            action_items: {new: {icon_class: "fake_icon"}, destroy: {only: %w[show edit]}}
          }
          config.css_classes = {header: "navbar-light bg-light"}
        end
    end

    test "does not equal the gloabl configs" do
      assert_not_equal @application.components, @resource.components
      assert_not_equal @application.css_classes, @resource.css_classes
    end

    test "does not equal the namespace configs" do
      assert_not_equal @namespace.components, @resource.components
      assert_not_equal @namespace.css_classes, @resource.css_classes
    end

    test "updates components" do
      assert_equal({input: "string"}, @resource.components[:active_admin_comments].deep_symbolize_keys)
      assert_equal(
        {
          new: {only: %w[index], icon_class: "fake_icon", css_class: "btn btn-primary"},
          edit: {only: %w[show], icon_class: nil, css_class: nil},
          destroy: {only: %w[show edit], icon_class: nil, css_class: nil}
        },
        @resource.components[:action_items].deep_symbolize_keys
      )
    end

    test "updates css_classes" do
      assert_equal "navbar-light bg-light", @resource.css_classes[:header]
    end
  end
end
