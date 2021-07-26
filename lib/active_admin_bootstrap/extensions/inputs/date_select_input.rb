module ActiveAdmin
  module Inputs
    class DateSelectInput < ::Formtastic::Inputs::DateSelectInput
      include ::ActiveAdminBootstrap::Extensions::Inputs::Base
    end
  end
end
