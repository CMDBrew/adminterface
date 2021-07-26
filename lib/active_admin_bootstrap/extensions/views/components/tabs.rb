module ActiveAdminBootstrap
  module Extensions
    module Views
      module Components
        module Tabs
          def build_menu_item(title, options, &_block)
            fragment = options.fetch(:id, fragmentize(title))
            html_options = options.fetch(:html_options, {})
            li html_options.merge(class: "nav-item") do
              if @http
                params[:tab] ||= @default_tab || fragment
                link_to title, url_for(tab: fragment, anchor: id, anchor_id: id), class: toggler_class(fragment)
              else
                link_to title, "##{fragment}", class: toggler_class(fragment), data: {"bs-toggle": "tab", "bs-target": "##{fragment}"}
              end
            end
          end

          def build_content_item(title, options, &block)
            fragment = options.fetch(:id, fragmentize(title))
            options = options.reverse_merge(id: fragmentize(title))
            div(options.merge(class: tab_pane_class(fragment)), &block)
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

          def toggler_class(fragment)
            "nav-link #{current_tab?(fragment) ? "active" : nil}".squish
          end

          def tab_pane_class(fragment)
            "tab-pane #{current_tab?(fragment) ? "active" : nil}".squish
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
  prepend ActiveAdminBootstrap::Extensions::Views::Components::Tabs
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
