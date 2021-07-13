module ActiveAdminBootstrap
  module Extensions
    module BatchActions
      module BatchActionSelector
        def dropdown_menu(name, options = {})
          options[:button] ||= {}
          options[:button] = {class: "#{options.dig(:button, :class)} #{table_tools_css_classes[:btn]}".squish}
          super(name, options)
        end
      end
    end
  end
end

# Overwrite activeadmin/lib/active_admin/batch_actions/views/batch_action_selector.rb
ActiveAdmin::BatchActions::BatchActionSelector.class_eval do
  prepend ActiveAdminBootstrap::Extensions::BatchActions::BatchActionSelector
  has_css_classes_for :table_tools
end
