module ActiveAdmin
  module Views
    # Overwrite activeadmin/lib/active_admin/form_build.rb
    class ActiveAdminForm < FormtasticProxy
      include ::ActiveAdminBootstrap::Configs::Finders

      has_css_classes_for :form

      def commit_action_with_cancel_link
        add_create_another_checkbox
        action(:submit, button_html: {class: form_css_classes.dig(:actions, :submit)})
        cancel_link({action: "index"}, class: form_css_classes.dig(:actions, :cancel))
      end

      def action(method, options = {})
        if method.eql?(:submit)
          options.reverse_merge!(button_html: {class: form_css_classes.dig(:actions, :submit)})
        end

        super(method, options)
      end
    end
  end
end
