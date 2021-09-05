module Adminterface
  module Extensions
    module Views
      module Components
        module IndexList
          def default_class_name
            "#{super} nav #{table_tools_css_classes.dig(:indexes, :tabs)}".squish
          end

          def tag_name
            :div
          end

          protected

          def build_index_list(index_class)
            params = request.query_parameters.except :page, :commit, :format
            url_with_params = url_for(params.merge(as: index_class.index_name.to_sym))
            name = index_class.index_name

            a(href: url_with_params,
              class: "index-mode-#{name} #{classes_for_link(index_class)}",
              title: name) do
              span I18n.t("active_admin.index_list.#{name}", default: name.to_s.titleize)
            end
          end

          def classes_for_link(index_class)
            klass = "nav-item nav-link"
            klass += " active" if current_index?(index_class)
            klass
          end
        end
      end
    end
  end
end

# Overwrite activeadmin/lib/active_admin/views/components/index_list.rb
ActiveAdmin::Views::IndexList.class_eval do
  prepend Adminterface::Extensions::Views::Components::IndexList
  has_css_classes_for :table_tools
end
