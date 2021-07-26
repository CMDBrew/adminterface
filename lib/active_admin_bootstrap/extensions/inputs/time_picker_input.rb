module ActiveAdminBootstrap
  module Extensions
    module Inputs
      module TimePickerInput
        include Base
        include Base::Stringish
        prepend Base::Groupish
      end
    end
  end
end

module ActiveAdmin
  module Inputs
    class TimePickerInput < ::Formtastic::Inputs::TimePickerInput
      include ::ActiveAdminBootstrap::Extensions::Inputs::TimePickerInput
    end
  end
end
