module ActiveAdminBootstrap
  module Extensions
    module Views
      module Components
        module TableFor
          def build(obj, *attrs)
            options = attrs.extract_options!
            options[:class] = "table_for #{options[:class]} #{table_for_css_classes}".squish
            attrs = attrs.push options
            super(obj, *attrs)
          end
        end
      end
    end
  end
end

# Overwrite activeadmin/lib/active_admin/views/components/table_for.rb
ActiveAdmin::Views::TableFor.class_eval do
  include ActiveAdminBootstrap::Configs::Finders
  prepend ActiveAdminBootstrap::Extensions::Views::Components::TableFor
  has_css_classes_for :table_for
end
