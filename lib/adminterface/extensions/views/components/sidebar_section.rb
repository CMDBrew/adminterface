module Adminterface
  module Extensions
    module Views
      module Components
        module SidebarSection
          def default_title_class
            "title #{sidebar_section_css_classes.dig(:header, :title)}".squish
          end

          def default_wrapper_class
            "panel #{sidebar_section_css_classes[:wrapper]}".squish
          end

          def default_header_class
            "panel-header #{sidebar_section_css_classes.dig(:header, :wrapper)}".squish
          end

          def default_body_class
            "panel-body #{sidebar_section_css_classes[:body]}".squish
          end
        end
      end
    end
  end
end

# Overwrite activeadmin/lib/active_admin/views/components/sidebar_section.rb
ActiveAdmin::Views::SidebarSection.class_eval do
  prepend Adminterface::Extensions::Views::Components::SidebarSection
  has_css_classes_for :sidebar_section

  def build(section)
    @section = section
    super(@section.title, section.options)
    add_class @section.custom_class if @section.custom_class
    self.id = @section.id
    build_sidebar_content
  end
end
