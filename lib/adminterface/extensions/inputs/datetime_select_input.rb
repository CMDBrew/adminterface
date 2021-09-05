module ActiveAdmin
  module Inputs
    class DatetimeSelectInput < ::Formtastic::Inputs::DatetimeSelectInput
      include ::Adminterface::Extensions::Inputs::Base
    end
  end
end
