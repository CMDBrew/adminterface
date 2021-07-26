module ActiveAdmin
  module Inputs
    class DatetimeSelectInput < ::Formtastic::Inputs::DatetimeSelectInput
      include ::ActiveAdminBootstrap::Extensions::Inputs::Base
    end
  end
end
