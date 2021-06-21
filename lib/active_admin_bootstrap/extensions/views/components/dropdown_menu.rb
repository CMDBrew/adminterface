module ActiveAdmin
  module Views
    # Overwrite activeadmin/lib/active_admin/views/components/dropdown_menu.rb
    class DropdownMenu < ActiveAdmin::Component
      def build(name, options = {})
        options = options.dup

        # Easily set options for the button or menu
        button_options = options.delete(:button) || {}
        menu_options = options.delete(:menu) || {}
        button_options[:class] = "#{button_options[:class]} dropdown-toggle"
        menu_options[:class] = "#{menu_options[:class]} dropdown-menu"
        options[:class] = "#{options[:class]} dropdown"

        @button = build_button(name, button_options.merge('data-toggle': "dropdown"))
        @menu = build_menu(menu_options)

        super(options)
      end

      def item_divider
        within @menu do
          li class: "dropdown-divider"
        end
      end

      def link_to(*args, &block)
        options = args.extract_options!
        options[:class] = "dropdown-item #{options[:class]}".strip
        super(*args, options, &block)
      end

      def item_html
        within @menu do
          li { yield }
        end
      end
    end
  end
end
