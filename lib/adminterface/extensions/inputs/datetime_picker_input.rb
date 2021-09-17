module Adminterface
  module Extensions
    module Inputs
      module DatetimePickerInput
        include Base
        include Base::Stringish
        prepend Base::Groupish
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
