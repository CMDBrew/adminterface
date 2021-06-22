module ActiveAdminBootstrap
  module Extensions
    module MenuItem
      def initialize(options = {})
        @icon = options[:icon]
        super
      end
    end
  end
end

# Overwrite lib/active_admin/menu_item.rb
ActiveAdmin::MenuItem.class_eval do
  prepend ActiveAdminBootstrap::Extensions::MenuItem
  attr_reader :icon
end
