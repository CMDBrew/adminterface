module Adminterface
  module Extensions
    module Views
      module Components
        module MenuItem
          private

          def menu_label
            if icon.present?
              Arbre::Context.new({}, self) do
                aa_icon(icon)
              end + helpers.content_tag(:span, label)
            else
              label
            end
          end

          def current_item_options(item)
            return {} unless item.current?(assigns[:current_tab])

            {
              class: "#{item.html_options[:class]} active".squish,
              "aria-current": "page"
            }
          end
        end
      end
    end
  end
end

# Overwrite activeadmin/lib/active_admin/views/components/menu_item.rb
ActiveAdmin::Views::MenuItem.class_eval do
  prepend Adminterface::Extensions::Views::Components::MenuItem
  attr_reader :icon

  def build(item, options = {})
    dropdown = options.delete(:dropdown) { false }

    super(options.merge(id: item.id))
    @label = helpers.render_in_context self, item.label
    @url = helpers.render_in_context self, item.url
    @icon = helpers.render_in_context self, item.icon
    @priority = item.priority
    @submenu = nil

    unless dropdown
      add_class "nav-item"
      item.html_options.reverse_merge!(class: "nav-link")
    end

    add_class "active" if item.current?(assigns[:current_tab])

    if item.items.any?
      item.html_options.merge!(class: "nav-link dropdown-toggle", "data-bs-toggle": "dropdown")
    end

    if url
      item_options = item.html_options.merge(current_item_options(item)).delete_if { |_k, v| v.blank? }
      text_node link_to(menu_label, url, **item_options)
    else
      span menu_label, item.html_options.merge(class: "navbar-text")
    end

    return unless item.items.any?
    add_class "has_nested dropdown"
    @submenu = menu(item, dropdown: true)
  end
end
