require "test_case/active_admin/base_test_case"

class ActionItemsTest < ActiveAdmin::BaseTestCase
  def default_css_classes
    @default_css_classes ||= Adminterface::Configs::DEFAULTS.dig(:css_classes, :action_items)
  end

  setup do
    @component = render_arbre_component do
      action_items [
        ActiveAdmin::ActionItem.new(:publish, class: "custom_class") do
          link_to "publish", "#"
        end,
        ActiveAdmin::ActionItem.new(:unpublish) do
          link_to "unpublish", "#"
        end
      ]
    end
  end

  test "#class_list" do
    assert @component.class_list.include?("action_items")

    default_css_classes[:group].split.each do |klass|
      assert @component.class_list.include?(klass)
    end
  end

  test "#content" do
    html =
      <<~ERB
        <a class="#{default_css_classes[:item]}" href="#">publish</a>
        <a class="#{default_css_classes[:item]}" href="#">unpublish</a>
      ERB
    assert_html html, @component.content
  end
end
