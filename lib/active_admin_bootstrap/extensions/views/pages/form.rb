module ActiveAdmin
  module Views
    module Pages
      # Overwrite activeadmin/lib/active_admin/views/pages/form.rb
      class Form < Base
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

        alias_method :form_section, :active_admin_form_for
      end
    end
  end
end
