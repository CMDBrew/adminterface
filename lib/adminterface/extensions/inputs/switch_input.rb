module ActiveAdmin
  module Inputs
    class SwitchInput < BooleanInput
      include ::Adminterface::Extensions::Inputs::Base

      def boolean_wrapper_class
        "#{super} form-switch".squish
      end
    end
  end
end
