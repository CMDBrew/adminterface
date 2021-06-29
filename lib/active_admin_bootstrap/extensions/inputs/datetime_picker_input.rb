module ActiveAdminBootstrap
  module Extensions
    module Inputs
      module DatetimePickerInput
        include Base

        def input_html_options
          super.merge(data: {"aa-datepicker": {enableTime: true, altFormat: "Y-m-d, h:i K"}})
        end
      end
    end
  end
end

module ActiveAdmin
  module Inputs
    class DatetimePickerInput < ::Formtastic::Inputs::DatetimePickerInput
      include ::ActiveAdminBootstrap::Extensions::Inputs::Base::Floatish
      include ::ActiveAdminBootstrap::Extensions::Inputs::DatetimePickerInput
    end
  end
end
