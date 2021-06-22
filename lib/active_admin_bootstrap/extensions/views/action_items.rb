module ActiveAdminBootstrap
  module Extensions
    module Views
      module ActionItems
        private

        def link_to(*args, &block)
          options = args.extract_options!
          options[:class] ||= action_items_css_classes[:item]
          text_node super(*args, options, &block)
        end

        def default_class_name
          "#{super} #{action_items_css_classes[:group]}".squish
        end
      end
    end
  end
end

# Overwrite lib/active_admin/views/action_items.rb
ActiveAdmin::Views::ActionItems.class_eval do
  prepend ActiveAdminBootstrap::Extensions::Views::ActionItems
  has_css_classes_for :action_items

  def build(action_items)
    action_items.each do |action_item|
      instance_exec(&action_item.block)
    end
  end
end
