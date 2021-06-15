module ActiveAdmin
  module Views
    # Overwrite activeadmin/lib/active_admin/views/components/scopes.rb
    class Scopes < ActiveAdmin::Component
      include ::ActiveAdminBootstrap::Configs::Finders

      has_css_classes_for :table_tools

      def build(scopes, options = {})
        scopes.group_by(&:group).each do |group, group_scopes|
          klass = "table_tools_segmented_control #{group_class(group)} nav #{table_tools_css_classes.dig(:scopes, :tabs)}".strip
          ul class: klass do
            group_scopes.each do |scope|
              build_scope(scope, options) if call_method_or_exec_proc(scope.display_if_block)
            end
          end
        end
      end

      protected

      def build_scope(scope, options)
        li class: classes_for_scope(scope) do
          params = request.query_parameters.except :page, :scope, :commit, :format

          a href: url_for(scope: scope.id, params: params), class: classes_for_link(scope) do
            span scope_name(scope)
            if options[:scope_count] && scope.show_count
              span get_scope_count(scope),
                class: "count #{count_class(scope)} #{table_tools_css_classes.dig(:scopes, :count)}".strip
            end
          end
        end
      end

      def count_class(scope)
        get_scope_count(scope).positive? ? "positive" : "empty"
      end

      def classes_for_scope(scope)
        classes = ["scope", "nav-item", scope.id]
        classes << "selected" if current_scope?(scope)
        classes.join(" ")
      end

      def classes_for_link(scope)
        classes = %w[nav-link]
        classes << "active" if current_scope?(scope)
        classes.join(" ")
      end
    end
  end
end
