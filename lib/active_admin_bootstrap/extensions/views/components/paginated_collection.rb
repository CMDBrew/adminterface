module ActiveAdminBootstrap
  module Extensions
    module Views
      module Components
        module PaginatedCollection
          protected

          def build_pagination
            options = {theme: @display_total ? "active_admin" : "active_admin_countless"}
            options[:params] = @params if @params
            options[:param_name] = @param_name if @param_name

            if !@display_total
              # The #paginate method in kaminari will query the resource with a
              # count(*) to determine how many pages there should be unless
              # you pass in the :total_pages option. We issue a query to determine
              # if there is another page or not, but the limit/offset make this
              # query fast.
              offset = collection.offset(collection.current_page * collection.limit_value).limit(1).count
              options[:total_pages] = collection.current_page + offset
              options[:right] = 0
            end

            options.merge!(configs.pager)
            text_node paginate collection, **options
          end

          def build_per_page_select
            div class: "pagination_per_page" do
              div class: "input-group input-group-sm" do
                span I18n.t("active_admin.pagination.per_page"), class: "input-group-text"

                select(class: "form-select") do
                  @per_page.each do |per_page|
                    option(per_page,
                      value: per_page,
                      selected: collection.limit_value == per_page ? "selected" : nil)
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

# Overwrite activeadmin/lib/active_admin/views/components/paginated_collection.rb
ActiveAdmin::Views::PaginatedCollection.class_eval do
  prepend ActiveAdminBootstrap::Extensions::Views::Components::PaginatedCollection
end
