module ActiveAdminBootstrap
  module Extensions
    module Inputs
      module Filters
        module Base
          module SearchMethodSelect
            def to_html
              input_wrapping do
                label_html << fields_html
              end
            end

            def fields_html
              template.content_tag :div, class: "row g-3" do
                template.content_tag(:div, select_html, class: "col") +
                  template.content_tag(:div, input_html, class: "col")
              end
            end

            def select_html
              template.select_tag(
                "",
                template.options_for_select(filter_options, current_filter),
                class: "form-select"
              )
            end
          end
        end
      end
    end
  end
end

# Overwrite activeadmin/lib/active_admin/inputs/filters/base/search_method_select.rb
ActiveAdmin::Inputs::Filters::Base::SearchMethodSelect.module_eval do
  prepend ActiveAdminBootstrap::Extensions::Inputs::Filters::Base::SearchMethodSelect
end
