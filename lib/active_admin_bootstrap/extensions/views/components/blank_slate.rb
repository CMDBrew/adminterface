module ActiveAdmin
  module Views
    # Overwrite lib/action_panel/extensions/views/components/index_list.rb
    class BlankSlate < ActiveAdmin::Component
      include ::ActiveAdminBootstrap::Configs::Finders

      has_css_classes_for :blank_slate

      def default_class_name
        "blank_slate_container #{blank_slate_css_classes}"
      end
    end
  end
end
