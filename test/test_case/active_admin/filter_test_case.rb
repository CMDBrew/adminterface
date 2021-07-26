require "test_case/active_admin/base_test_case"

class ActiveAdmin::FilterTestCase < ActiveAdmin::BaseTestCase
  class FilterView < ::ActiveAdmin::IntegrationTestHelper::MockActionView
    def collection_path
      "fake/path"
    end
  end

  def render_filter(search, filters, helpers = FilterView)
    form = render_arbre_component({filter_args: [search, filters]}, mock_action_view(helpers)) do
      args = assigns[:filter_args]
      kwargs = args.pop if args.last.is_a?(Hash)
      text_node active_admin_filters_form_for(*args, **kwargs)
    end

    Capybara.string(form.to_s)
  end
end
