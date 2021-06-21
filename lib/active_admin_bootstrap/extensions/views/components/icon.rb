module ActiveAdmin
  module Views
    # Custom component for icon
    class Icon < ActiveAdmin::Component
      include ::ActiveAdminBootstrap::Configs::Finders

      builder_method :aa_icon
      has_css_classes_for :icon

      def build(icon, attributes = {})
        super(attributes)
        add_class icon
      end

      def tag_name
        :i
      end

      def default_class_name
        "aa-icon #{icon_css_classes}"
      end
    end
  end
end
