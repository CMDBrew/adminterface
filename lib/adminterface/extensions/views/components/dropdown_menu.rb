module Adminterface
  module Extensions
    module Views
      module Components
        module DropdownMenu
          def item_divider
            within @menu do
              li class: "dropdown-divider"
            end
          end

          def item_html
            within @menu do
              li { yield }
            end
          end

          def link_to(*args, &block)
            options = args.extract_options!
            options[:class] = "dropdown-item #{options[:class]}".squish
            super(*args, options, &block)
          end

          private

          def build_menu(options)
            options[:class] ||= ""
            options[:class] = "#{options[:class]} dropdown_menu_list dropdown-menu".squish
            ul(options)
          end
        end
      end
    end
  end
end

# Overwrite activeadmin/lib/active_admin/views/components/dropdown_menu.rb
ActiveAdmin::Views::DropdownMenu.class_eval do
  prepend Adminterface::Extensions::Views::Components::DropdownMenu

  def build(name, options = {})
    options = options.dup

    # Easily set options for the button or menu
    button_options = options.delete(:button) || {}
    menu_options = options.delete(:menu) || {}
    button_options[:class] = "#{button_options[:class]} dropdown-toggle".squish
    options[:class] = "#{options[:class]} dropdown".squish

    @button = build_button(
      name,
      button_options.merge("data-bs-toggle": "dropdown", role: "button", "aria-expanded": "false")
    )
    @menu = build_menu(menu_options)

    super(options)
  end
end
