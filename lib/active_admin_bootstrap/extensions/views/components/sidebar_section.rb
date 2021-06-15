module ActiveAdmin
  module Views
    # Overwrite lib/active_admin/sidebar_section.rb
    class SidebarSection < Panel
      has_css_classes_for :sidebar_section

      def default_wrapper_class
        "panel #{sidebar_section_css_classes[:wrapper]}".strip
      end

      def default_header_class
        "panel-header #{sidebar_section_css_classes[:header]}".strip
      end

      def default_body_class
        "panel-body #{sidebar_section_css_classes[:body]}".strip
      end
    end
  end
end
