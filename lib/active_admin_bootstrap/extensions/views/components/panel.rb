module ActiveAdminBootstrap
  module Extensions
    module Views
      module Components
        module Panel
          def build_title(title)
            return if title.blank?

            div title.to_s, class: default_title_class
          end

          def default_title_class
            "title #{panel_css_classes.dig(:header, :title)}".squish
          end

          def default_wrapper_class
            "panel #{panel_css_classes[:wrapper]}".squish
          end

          def default_header_class
            "panel-header #{panel_css_classes.dig(:header, :wrapper)}".squish
          end

          def default_body_class
            "panel-body #{panel_css_classes[:body]}".squish
          end

          def header_action(*args)
            action = args[0]

            @title << div(class: "header_action") do
              html = []
              html << action
              html << yield if block_given?
              safe_join(html)
            end
          end
        end
      end
    end
  end
end

# Overwrite activeadmin/lib/active_admin/views/components/panel.rb
ActiveAdmin::Views::Panel.class_eval do
  prepend ActiveAdminBootstrap::Extensions::Views::Components::Panel
  has_css_classes_for :panel

  def build(title = nil, attributes = {})
    header_class = attributes.delete(:header_class)
    body_class = attributes.delete(:body_class)
    super(attributes)
    add_class default_wrapper_class

    @title = div(build_title(title), class: "#{default_header_class} #{header_class}".squish)
    @contents = div(class: "panel_contents #{default_body_class} #{body_class}".squish)
  end
end
