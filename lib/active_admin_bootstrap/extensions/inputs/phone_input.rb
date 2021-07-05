module ActiveAdminBootstrap
  module Extensions
    module Inputs
      module PhoneInput
        include Base
      end
    end
  end
end

module ActiveAdmin
  module Inputs
    class PhoneInput < ::Formtastic::Inputs::PhoneInput
      include ::ActiveAdminBootstrap::Extensions::Inputs::PhoneInput
    end
  end
end
