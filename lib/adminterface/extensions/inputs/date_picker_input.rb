module Adminterface
  module Extensions
    module Inputs
      module DatePickerInput
        include Base
        include Base::Stringish
        prepend Base::Groupish

        def input_html_options
          opts = super
          opts[:class] = "#{opts[:class]} form-control".squish
          opts
        end
      end
    end
  end
end

module ActiveAdmin
  module Inputs
    class DatePickerInput < ::Formtastic::Inputs::DatePickerInput
      include ::Adminterface::Extensions::Inputs::DatePickerInput
    end
  end
end

# Overwrite activeadmin/lib/active_admin/inputs/datepicker_input.rb
ActiveAdmin::Inputs::DatepickerInput.class_eval do
  prepend ::Adminterface::Extensions::Inputs::DatePickerInput
end
