module ActiveAdminBootstrap
  module Extensions
    module Views
      module Components
        module PaginatedCollection
          def build(collection, options = {})
            @config = options.delete(:config) || {}
            super(collection, options)
          end

          protected

          def build_pagination_with_formats(options)
            if pagination?
              super
            else
              div id: "index_footer" do
                formats = build_download_formats @download_links
                build_download_format_links formats if formats.any?
              end
            end
          end

          def build_per_page_select
            div class: "pagination_per_page" do
              div class: "input-group input-group-sm" do
                div class: "input-group-prepend" do
                  label I18n.t("active_admin.pagination.per_page"), class: "input-group-text"
                end

                select(class: "custom-select") do
                  @per_page.each do |per_page|
                    option(per_page,
                      value: per_page,
                      selected: collection.limit_value == per_page ? "selected" : nil)
                  end
                end
              end
            end
          end

          private

          def indexes_with_paginations
            %i[table grid blog block]
          end

          def pagination?
            indexes_with_paginations.include?(config[:as])
          end
        end
      end
    end
  end
end

# Overwrite lib/active_admin/views/components/paginated_collection.rb
ActiveAdmin::Views::PaginatedCollection.class_eval do
  prepend ActiveAdminBootstrap::Extensions::Views::Components::PaginatedCollection
  attr_reader :config
end
