module ActiveAdmin
  module Views
    # Overwrite activeadmin/lib/active_admin/views/components/menu.rb
    class Menu < Component
      def build(menu, options = {})
        dropdown = options.delete(:dropdown) { false }
        menu_class = dropdown ? "dropdown-menu" : ""
        item_class = dropdown ? "dropdown-item" : ""

        @menu = menu
        super(options.reverse_merge!(class: menu_class))

        menu.items.each do |item|
          next unless helpers.render_in_context self, item.should_display

          menu_item(item, class: item_class, dropdown: dropdown)
        end
        children.sort!
      end
    end
  end
end
