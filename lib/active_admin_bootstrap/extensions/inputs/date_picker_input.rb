module ActiveAdminBootstrap
  module Extensions
    module Inputs
      module DatePickerInput
        include Base

        def input_html_options
          super.merge(data: {"aa-datepicker": {enableTime: false, altFormat: "Y-m-d"}})
        end
      end
    end
  end
end

module ActiveAdmin
  module Inputs
    class DatePickerInput < ::Formtastic::Inputs::DatePickerInput
      include ::ActiveAdminBootstrap::Extensions::Inputs::Base::Floatish
      include ::ActiveAdminBootstrap::Extensions::Inputs::DatePickerInput
    end
  end
end

# Overwrite activeadmin/lib/active_admin/inputs/datepicker_input.rb
ActiveAdmin::Inputs::DatepickerInput.class_eval do
  prepend ::ActiveAdminBootstrap::Extensions::Inputs::Base::Floatish
  prepend ::ActiveAdminBootstrap::Extensions::Inputs::DatePickerInput
end
