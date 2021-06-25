module ActiveAdminBootstrap
  module Extensions
    module Filters
      module ViewHelper
        def active_admin_filters_form_for(search, filters, options = {})
          options = defaults.deep_merge(options).deep_merge(required)

          form_for search, options do |f|
            filters.each do |attribute, opts|
              next if opts.key?(:if) && !call_method_or_proc_on(self, opts[:if])
              next if opts.key?(:unless) && call_method_or_proc_on(self, opts[:unless])

              opts[:input_html] = instance_exec(&opts[:input_html]) if opts[:input_html].is_a?(Proc)
              f.filter attribute, opts.except(:if, :unless)
            end

            f.template.concat buttons(f)
          end
        end

        private

        def defaults
          {
            builder: ActiveAdmin::Filters::FormBuilder,
            url: collection_path,
            html: {class: "filter_form formtastic"}
          }
        end

        def required
          {
            html: {method: :get},
            as: :q
          }
        end

        def buttons(form)
          content_tag :fieldset, class: "actions" do
            content_tag :ol do
              wrap_button { submit_button(form) } +
                wrap_button { cancel_button } +
                hidden_field_tags_for(params, except: except_hidden_fields)
            end
          end
        end

        def wrap_button(&block)
          content_tag :li, &block
        end

        def submit_button(form)
          form.submit(I18n.t("active_admin.filters.buttons.filter"), class: submit_class)
        end

        def cancel_button
          link_to(I18n.t("active_admin.filters.buttons.clear"), "#",
            class: "#{cancel_class} clear_filters_btn")
        end

        def submit_class
          @submit_class ||= find_configs(:css_classes, :filters, :actions, :submit)
        end

        def cancel_class
          @cancel_class ||= find_configs(:css_classes, :filters, :actions, :cancel)
        end
      end
    end
  end
end

# Overwirte lib/active_admin/filters/forms.rb
ActiveAdmin::Filters::ViewHelper.module_eval do
  prepend ActiveAdminBootstrap::Extensions::Filters::ViewHelper
end
