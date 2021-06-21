module ActiveAdmin
  module Views
    # Overwrite activeadmin/lib/active_admin/views/action_items.rb
    class ActionItems < ActiveAdmin::Component
      include ::ActiveAdminBootstrap::Configs::Finders

      has_css_classes_for :action_items

      def build(action_items)
        action_items.each do |action_item|
          instance_exec(&action_item.block)
        end
      end

      private

      def link_to(*args, &block)
        options = args.extract_options!
        options[:class] ||= action_items_css_classes[:item]
        text_node super(*args, options, &block)
      end

      def default_class_name
        "action_items #{action_items_css_classes[:group]}".strip
      end
    end
  end
end
