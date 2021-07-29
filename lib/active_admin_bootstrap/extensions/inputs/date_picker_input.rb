module ActiveAdminBootstrap
  module Extensions
    module Inputs
      module DatePickerInput
        include Base
        include Base::Stringish
        prepend Base::Groupish

        def input_html_options
          opts = super
          opts[:class] = "#{opts[:class]} form-control".squish
          opts.merge(flatpickr_options)
        end

        def flatpickr_options
          {data: {"aa-datepicker": flatpickr}}
        end

        private

        def flatpickr
          options[:flatpickr] || inputs_config.dig(:date_picker)
        end
      end
    end
  end
end

module ActiveAdmin
  module Inputs
    class DatePickerInput < ::Formtastic::Inputs::DatePickerInput
      include ::ActiveAdminBootstrap::Extensions::Inputs::DatePickerInput
    end
  end
end

# Overwrite activeadmin/lib/active_admin/inputs/datepicker_input.rb
ActiveAdmin::Inputs::DatepickerInput.class_eval do
  prepend ::ActiveAdminBootstrap::Extensions::Inputs::DatePickerInput
end
