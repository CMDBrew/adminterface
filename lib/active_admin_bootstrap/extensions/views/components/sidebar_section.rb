module ActiveAdminBootstrap
  module Extensions
    module Views
      module Components
        module SidebarSection
          def default_wrapper_class
            "panel #{sidebar_section_css_classes[:wrapper]}".squish
          end

          def default_header_class
            "panel-header #{sidebar_section_css_classes[:header]}".squish
          end

          def default_body_class
            "panel-body #{sidebar_section_css_classes[:body]}".squish
          end
        end
      end
    end
  end
end

# Overwrite lib/active_admin/views/components/sidebar_section.rb
ActiveAdmin::Views::SidebarSection.class_eval do
  prepend ActiveAdminBootstrap::Extensions::Views::Components::SidebarSection
  has_css_classes_for :sidebar_section
end
