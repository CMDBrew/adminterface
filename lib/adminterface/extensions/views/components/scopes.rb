module Adminterface
  module Extensions
    module Views
      module Components
        module Scopes
          def group_class(group)
            "#{super} nav #{table_tools_css_classes.dig(:scopes, :tabs)}".squish
          end

          protected

          def build_scope(scope, options)
            li class: classes_for_scope(scope) do
              params = request.query_parameters.except :page, :scope, :commit, :format

              a href: url_for(scope: scope.id, params: params), class: classes_for_link(scope) do
                span scope_name(scope)
                if options[:scope_count] && scope.show_count
                  span get_scope_count(scope),
                    class: "count #{count_class(scope)}".squish
                end
              end
            end
          end

          def count_class(scope)
            if get_scope_count(scope).positive?
              table_tools_css_classes.dig(:scopes, :counts, :positive)
            else
              table_tools_css_classes.dig(:scopes, :counts, :zero)
            end
          end

          def classes_for_scope(scope)
            "#{super} nav-item".squish
          end

          def classes_for_link(scope)
            classes = %w[nav-link]
            classes << "active" if current_scope?(scope)
            classes.join(" ")
          end
        end
      end
    end
  end
end

# Overwrite activeadmin/lib/active_admin/views/components/scopes.rb
ActiveAdmin::Views::Scopes.class_eval do
  prepend Adminterface::Extensions::Views::Components::Scopes
  has_css_classes_for :table_tools
end
