module Adminterface
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

          def header_html_options
            header_html[:class] = "#{default_header_class} #{header_html[:class]}".squish
            header_html
          end

          def body_html_options
            body_html[:class] = "panel_contents #{default_body_class} #{body_html[:class]}".squish
            body_html
          end
        end
      end
    end
  end
end

# Overwrite activeadmin/lib/active_admin/views/components/panel.rb
ActiveAdmin::Views::Panel.class_eval do
  prepend Adminterface::Extensions::Views::Components::Panel
  has_css_classes_for :panel
  attr_accessor :header_html, :body_html

  def build(*args)
    options = args.extract_options!
    title = args.first
    @header_html = options.delete(:header_html) || {}
    @body_html = options.delete(:body_html) || {}
    super(options)
    add_class default_wrapper_class

    @title = div(build_title(title), **header_html_options)
    @contents = div(**body_html_options)
  end
end
