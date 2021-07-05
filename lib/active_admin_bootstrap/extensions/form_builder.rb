module ActiveAdminBootstrap
  module Extensions
    module FormBuilder
      def semantic_errors(*args)
        return if @object.errors.blank?

        template.content_tag :div, class: form_css_classes[:error] do
          super(*args)
        end
      end
    end
  end
end

# Overwrite activeadmin/lib/active_admin/form_builder.rb
ActiveAdmin::FormBuilder.class_eval do
  prepend ActiveAdminBootstrap::Extensions::FormBuilder

  has_css_classes_for :form
  configure :default_text_area_height, 3
  configure :default_inline_error_class, "inline-errors invalid-feedback"
end
