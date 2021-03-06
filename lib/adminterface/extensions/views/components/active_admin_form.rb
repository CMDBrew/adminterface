module Adminterface
  module Extensions
    module Views
      module ActiveAdminForm
        def input(...)
          default_field_error_proc = ::ActionView::Base.field_error_proc
          ::ActionView::Base.field_error_proc = proc { |html_tag, _instance_tag| html_tag }
          super
        ensure
          ::ActionView::Base.field_error_proc = default_field_error_proc
        end

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

# Overwrite activeadmin/lib/active_admin/views/active_admin_form.rb
ActiveAdmin::Views::ActiveAdminForm.class_eval do
  prepend Adminterface::Extensions::Views::ActiveAdminForm
  has_css_classes_for :form
end

ActiveAdmin::Views::SemanticInputsProxy.class_eval do
  def build(form_builder, *args, &block)
    html_options = args.extract_options!
    html_options[:class] ||= "inputs"
    legend = args.shift if args.first.is_a?(::String)
    legend = html_options.delete(:name) if html_options.key?(:name)
    legend_tag = legend ? "<legend><span>#{legend}</span></legend>" : ""
    fieldset_attrs = html_options.map { |k, v| %(#{k}="#{v}") }.join(" ")
    @opening_tag = "<fieldset #{fieldset_attrs}>#{legend_tag}"
    @closing_tag = "</fieldset>"
    super(*(args << html_options), &block)
  end
end
