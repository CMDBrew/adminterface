module ActiveAdminBootstrap
  module Extensions
    module Views
      module ActiveAdminForm
        def action(method, options = {})
          if method.eql?(:submit)
            options.reverse_merge!(button_html: {class: form_css_classes.dig(:actions, :submit)})
          end

          super(method, options)
        end

        def cancel_link(url = {action: "index"}, html_options = {class: form_css_classes.dig(:actions, :cancel)}, li_attrs = {})
          super(url, html_options, li_attrs)
        end
      end
    end
  end
end

# Overwrite lib/active_admin/views/active_admin_form.rb
ActiveAdmin::Views::ActiveAdminForm.class_eval do
  prepend ActiveAdminBootstrap::Extensions::Views::ActiveAdminForm
  has_css_classes_for :form
end
