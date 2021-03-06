require "test_helper"

class HeaderTest < ActiveAdmin::BaseTestCase
  def application
    @application ||= ActiveAdmin::Application.new
  end

  def namespace
    @namespace ||= ActiveAdmin::Namespace.new(application, :admin)
  end

  def default_css_classes
    @default_css_classes ||= Adminterface::Configs::DEFAULTS.dig(:css_classes, :header)
  end

  setup do
    namespace.site_title = "Awesome Admin"

    @component =
      render_arbre_component({namespace: namespace}, mock_action_view) do
        header namespace, OpenStruct.new(items: [])
      end
  end

  test "#tag_name" do
    assert_equal "nav", @component.tag_name.to_s
  end

  test "#class_list" do
    assert @component.class_list.include?("header")
    assert @component.class_list.include?("navbar")

    class_list = default_css_classes[:wrapper] || ""
    class_list.split.each do |klass|
      assert @component.class_list.include?(klass)
    end
  end

  test "#content" do
    html =
      <<~ERB
        <div class="header-container #{default_css_classes[:container]}">
          <div class="site_title navbar-brand">
            <div class="title">Awesome Admin</div>
          </div>
          <button class="navbar-toggler" data-bs-target="#header-nav" data-bs-toggle="collapse" aria-expanded="false">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div id="header-nav" class="collapse navbar-collapse">
            <ul class="navbar-nav" id="main-nav"></ul>
            <ul class="navbar-nav" id="utility-nav"></ul>
          </div>
        </div>
      ERB
    assert_html html, @component.content
  end
end
