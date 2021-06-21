require "test_helper"

module ConfigurationsTest
  class Base < ActiveSupport::TestCase
    setup do
      @application = ActiveAdmin::Application.new
      @configs = ActiveAdminBootstrap::Configs::DEFAULTS
    end
  end

  class DefaultTest < Base
    test "default layouts" do
      assert_equal @configs[:layouts], @application.layouts
    end

    test "default icons" do
      assert_equal @configs[:icons], @application.icons
    end

    test "default components" do
      assert_equal @configs[:components], @application.components
    end

    test "default css_classes" do
      assert_equal @configs[:css_classes], @application.css_classes
    end

    test "default breakpoints" do
      assert_equal @configs[:breakpoints], @application.breakpoints
    end
  end

  class GlobalTest < Base
    setup do
      @application.layouts = {navigation: "left", filter: "body", sidebar: "left"}
      @application.icons = {filters: {aside: {open: "open", close: "close"}}}
      @application.components = {
        active_admin_comments: {input: "string"},
        action_items: {new: {icon: "fake_icon"}, destroy: {display: %w[show edit]}}
      }
      @application.css_classes = {header: "navbar-light bg-light"}
      @application.breakpoints = {columns: "lg", index_as_grid: "sm"}
    end

    test "updates layouts" do
      assert_equal "left", @application.layouts[:navigation]
      assert_equal "body", @application.layouts[:filter]
      assert_equal "left", @application.layouts[:sidebar]
    end

    test "updates icons" do
      assert_equal(
        {aside: {open: "open", close: "close"}},
        @application.icons[:filters].deep_symbolize_keys
      )
    end

    test "updates components" do
      assert_equal({input: "string"}, @application.components[:active_admin_comments].deep_symbolize_keys)
      assert_equal(
        {
          new: {display: %w[index], icon: "fake_icon", css_class: "btn btn-primary"},
          edit: {display: %w[show], icon: nil, css_class: nil},
          destroy: {display: %w[show edit], icon: nil, css_class: nil}
        },
        @application.components[:action_items].deep_symbolize_keys
      )
    end

    test "updates css_classes" do
      assert_equal "navbar-light bg-light", @application.css_classes[:header]
    end

    test "updates breakpoints" do
      assert_equal({columns: "lg", index_as_grid: "sm"}, @application.breakpoints.deep_symbolize_keys)
    end
  end

  class NamespaceTest < Base
    setup do
      @namespace = ActiveAdmin::Namespace.new(@application, :super_admin)
      @namespace.layouts = {navigation: "left", filter: "body", sidebar: "left"}
      @namespace.icons = {filters: {aside: {open: "open", close: "close"}}}
      @namespace.components = {
        active_admin_comments: {input: "string"},
        action_items: {new: {icon: "fake_icon"}, destroy: {display: %w[show edit]}}
      }
      @namespace.css_classes = {header: "navbar-light bg-light"}
      @namespace.breakpoints = {columns: "lg", index_as_grid: "sm"}
    end

    test "does not equal the gloabl configs" do
      assert_not_equal @application.layouts, @namespace.layouts
      assert_not_equal @application.components, @namespace.components
      assert_not_equal @application.css_classes, @namespace.css_classes
      assert_not_equal @application.breakpoints, @namespace.breakpoints
    end

    test "updates layouts" do
      assert_equal "left", @namespace.layouts[:navigation]
      assert_equal "body", @namespace.layouts[:filter]
      assert_equal "left", @namespace.layouts[:sidebar]
    end

    test "updates icons" do
      assert_equal(
        {aside: {open: "open", close: "close"}},
        @namespace.icons[:filters].deep_symbolize_keys
      )
    end

    test "updates components" do
      assert_equal({input: "string"}, @namespace.components[:active_admin_comments].deep_symbolize_keys)
      assert_equal(
        {
          new: {display: %w[index], icon: "fake_icon", css_class: "btn btn-primary"},
          edit: {display: %w[show], icon: nil, css_class: nil},
          destroy: {display: %w[show edit], icon: nil, css_class: nil}
        },
        @namespace.components[:action_items].deep_symbolize_keys
      )
    end

    test "updates css_classes" do
      assert_equal "navbar-light bg-light", @namespace.css_classes[:header]
    end

    test "updates breakpoints" do
      assert_equal({columns: "lg", index_as_grid: "sm"}, @namespace.breakpoints.deep_symbolize_keys)
    end
  end

  class ResourceTest < Base
    setup do
      @namespace = ActiveAdmin::Namespace.new(@application, :admin)
      @resource =
        @namespace.register(User) do
          config.layouts = {navigation: "left", filter: "body", sidebar: "left"}
          config.icons = {filters: {aside: {open: "open", close: "close"}}}
          config.components = {
            active_admin_comments: {input: "string"},
            action_items: {new: {icon: "fake_icon"}, destroy: {display: %w[show edit]}}
          }
          config.css_classes = {header: "navbar-light bg-light"}
          config.breakpoints = {columns: "lg", index_as_grid: "sm"}
        end
    end

    test "does not equal the gloabl configs" do
      assert_not_equal @application.layouts, @resource.layouts
      assert_not_equal @application.icons, @resource.icons
      assert_not_equal @application.components, @resource.components
      assert_not_equal @application.css_classes, @resource.css_classes
      assert_not_equal @application.breakpoints, @resource.breakpoints
    end

    test "does not equal the namespace configs" do
      assert_not_equal @namespace.layouts, @resource.layouts
      assert_not_equal @namespace.icons, @resource.icons
      assert_not_equal @namespace.components, @resource.components
      assert_not_equal @namespace.css_classes, @resource.css_classes
      assert_not_equal @namespace.breakpoints, @resource.breakpoints
    end

    test "updates layouts" do
      assert_equal "left", @resource.layouts[:navigation]
      assert_equal "body", @resource.layouts[:filter]
      assert_equal "left", @resource.layouts[:sidebar]
    end

    test "updates icons" do
      assert_equal(
        {aside: {open: "open", close: "close"}},
        @resource.icons[:filters].deep_symbolize_keys
      )
    end

    test "updates components" do
      assert_equal({input: "string"}, @resource.components[:active_admin_comments].deep_symbolize_keys)
      assert_equal(
        {
          new: {display: %w[index], icon: "fake_icon", css_class: "btn btn-primary"},
          edit: {display: %w[show], icon: nil, css_class: nil},
          destroy: {display: %w[show edit], icon: nil, css_class: nil}
        },
        @resource.components[:action_items].deep_symbolize_keys
      )
    end

    test "updates css_classes" do
      assert_equal "navbar-light bg-light", @resource.css_classes[:header]
    end

    test "updates breakpoints" do
      assert_equal({columns: "lg", index_as_grid: "sm"}, @resource.breakpoints.deep_symbolize_keys)
    end
  end
end
