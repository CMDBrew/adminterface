module ActiveAdmin
  # Overwrite MenuItem - activeadmin/lib/active_admin/resource/menu_item.rb
  class MenuItem
    attr_reader :icon

    def initialize(options = {})
      super() # MenuNode
      @label = options[:label]
      @dirty_id = options[:id] || options[:label]
      @url = options[:url] || "#"
      @priority = options[:priority] || 10
      @html_options = options[:html_options] || {}
      @should_display = options[:if] || proc { true }
      @parent = options[:parent]
      @icon = options[:icon]

      yield(self) if block_given? # Builder style syntax
    end
  end
end
