module ActiveAdminBootstrap
  module Extensions
    module Views
      module Pages
        module Form
          def main_content
            options = default_form_options.merge form_presenter.options

            if options[:partial]
              render options[:partial]
            elsif options[:multiple]
              instance_exec(&form_presenter.block)
            else
              active_admin_form_for resource, options, &form_presenter.block
            end
          end
        end
      end
    end
  end
end

# Overwrite lib/active_admin/views/pages/form.rb
ActiveAdmin::Views::Pages::Form.class_eval do
  prepend ActiveAdminBootstrap::Extensions::Views::Pages::Form
  alias_method :form_section, :active_admin_form_for
end
