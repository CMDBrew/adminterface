module ActiveAdmin
  module Inputs
    class DateSelectInput < ::Formtastic::Inputs::DateSelectInput
      include ::Adminterface::Extensions::Inputs::Base
    end
  end
end
