module Adminterface
  module Extensions
    module Inputs
      module DatetimePickerInput
        include Base
        include Base::Stringish
        prepend Base::Groupish

        def input_html_options
          super.merge(flatpickr_options)
        end

        def flatpickr_options
          {data: {"aa-datepicker": flatpickr}}
        end

        private

        def flatpickr
          options[:flatpickr] || inputs_config.dig(:datetime_picker)
        end
      end
    end
  end
end

module ActiveAdmin
  module Inputs
    class DatetimePickerInput < ::Formtastic::Inputs::DatetimePickerInput
      include ::Adminterface::Extensions::Inputs::DatetimePickerInput
    end
  end
end
