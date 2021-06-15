module ActiveAdmin
  module Views
    # Overwrite activeadmin/lib/active_admin/views/components/index_list.rb
    class IndexList < ActiveAdmin::Component
      include ::ActiveAdminBootstrap::Configs::Finders
      include ::ActiveAdmin::Helpers::Collection

      builder_method :index_list_renderer
      has_css_classes_for :table_tools

      def tag_name
        :div
      end

      def default_class_name
        "indexes table_tools_segmented_control nav #{table_tools_css_classes.dig(:indexes, :tabs)}".strip
      end

      protected

      def build_index_list(index_class)
        params = request.query_parameters.except :page, :commit, :format
        url_with_params = url_for(params.merge(as: index_class.index_name.to_sym))
        name = index_class.index_name

        a(href: url_with_params,
          class: "#{classes_for_link(index_class)} index-mode-#{name}",
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
