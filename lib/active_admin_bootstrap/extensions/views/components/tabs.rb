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
                link_to title, url_for(tab: fragment), class: "nav-link #{current_tab?(fragment) ? "active" : nil}".strip
              else
                link_to title, "##{fragment}", class: "nav-link"
              end
            end
          end

          def build_content_item(title, options, &block)
            fragment = options.fetch(:id, fragmentize(title))
            options = options.reverse_merge(id: fragmentize(title))
            klass = options.delete(:class)
            if @http
              div(options.merge(class: "#{klass} active"), &block) if current_tab?(fragment)
            else
              div(options, &block)
            end
          end

          private

          def current_tab?(tab)
            tab.eql?(params[:tab])
          end
        end
      end
    end
  end
end

# Overwrite lib/active_admin/views/components/tabs.rb
ActiveAdmin::Views::Tabs.class_eval do
  prepend ActiveAdminBootstrap::Extensions::Views::Components::Tabs
  has_css_classes_for :tabs

  def build(options = {}, &_block)
    klass = options.delete(:class) { tabs_css_classes }
    @http = options.delete(:http) { false }
    @default_tab = options.delete(:default)
    add_class "http-tabs" if @http

    @ctrls = div class: "tab-ctrls"
    @menu = ul(class: "nav #{klass}", role: "tablist")
    @tabs_content = div(class: "tab-content")
    @ctrls << @menu
  end
end
