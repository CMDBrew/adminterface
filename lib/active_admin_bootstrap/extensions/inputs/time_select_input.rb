module ActiveAdmin
  module Inputs
    class TimeSelectInput < ::Formtastic::Inputs::TimeSelectInput
      include ::ActiveAdminBootstrap::Extensions::Inputs::Base
    end
  end
end
