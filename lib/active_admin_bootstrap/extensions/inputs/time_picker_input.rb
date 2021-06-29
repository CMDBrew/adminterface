module ActiveAdminBootstrap
  module Extensions
    module Inputs
      module TimePickerInput
        include Base
      end
    end
  end
end

module ActiveAdmin
  module Inputs
    class TimePickerInput < ::Formtastic::Inputs::TimePickerInput
      include ::ActiveAdminBootstrap::Extensions::Inputs::Base::Floatish
      include ::ActiveAdminBootstrap::Extensions::Inputs::TimePickerInput
    end
  end
end
