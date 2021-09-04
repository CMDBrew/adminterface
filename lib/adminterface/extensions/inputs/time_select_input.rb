module ActiveAdmin
  module Inputs
    class TimeSelectInput < ::Formtastic::Inputs::TimeSelectInput
      include ::Adminterface::Extensions::Inputs::Base
    end
  end
end
