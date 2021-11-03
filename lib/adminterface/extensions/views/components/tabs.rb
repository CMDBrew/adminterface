module Adminterface
  module Extensions
    module Views
      module Components
        module Tabs
          def build_menu_item(title, options, &_block)
            fragment = options.fetch(:id, fragmentize(title))
            html_options = options.fetch(:html_options, {})

            li html_options.merge(class: "nav-item", role: "presentation") do
              @http ? link_to_http(title, fragment) : link_to_js(title, fragment)
            end
          end

          def build_content_item(title, options, &block)
            fragment = options.fetch(:id, fragmentize(title))
            options = options.reverse_merge(id: fragment, "aria-labelledby": "#{fragment}-tab")
            div(options.merge(tab_pane_options(fragment)), &block)
          end

          def default_css_class
            tabs_css_classes
          end

          def nav_html_options
            nav_html[:class] = "nav #{default_css_class} #{nav_html[:class]}".squish
            nav_html[:role] = "tablist"
            nav_html
          end

          def content_html_options
            content_html[:class] = "tab-content #{content_html[:class]}".squish
            content_html
          end

          private

          def link_to_js(title, fragment)
            options = toggler_options(fragment).merge(data: {"bs-toggle": "tab", "bs-target": "##{fragment}"})
            link_to(title, "##{fragment}", **options)
          end

          def link_to_http(title, fragment)
            params[:tab] ||= @default_tab || fragment

            link_to(title,
              url_for(controller: resource_scope[:controller],
                      action: resource_scope[:action], tab: fragment, anchor: id, anchor_id: id),
              **toggler_options(fragment))
          end

          def resource_scope
            session.fetch(:resource_scope, {}).with_indifferent_access
          end

          def toggler_options(fragment)
            defaults = {id: "#{fragment}-tab", "aria-controls": fragment}
            options =
              if current_tab?(fragment)
                {class: "nav-link active", "aria-selected": "true"}
              else
                {class: "nav-link", "aria-selected": "false"}
              end

            defaults.merge(options)
          end

          def tab_pane_options(fragment)
            {
              class: "tab-pane #{current_tab?(fragment) ? "active" : nil}".squish,
              role: "tabpanel"
            }
          end

          def current_tab?(fragment)
            fragment.eql?(params[:tab]) || (!@http && @tabs_content&.children.blank?)
          end
        end
      end
    end
  end
end

# Overwrite activeadmin/lib/active_admin/views/components/tabs.rb
ActiveAdmin::Views::Tabs.class_eval do
  prepend Adminterface::Extensions::Views::Components::Tabs
  has_css_classes_for :tabs
  attr_accessor :nav_html, :content_html, :id

  def build(options = {}, &_block)
    @nav_html = options.delete(:nav_html) || {}
    @content_html = options.delete(:content_html) || {}
    @http = options.delete(:http) { false }
    @default_tab = options.delete(:default)
    @id = options[:id]
    super(options)

    @menu = ul(**nav_html_options)
    @tabs_content = div(**content_html_options)
  end
end
