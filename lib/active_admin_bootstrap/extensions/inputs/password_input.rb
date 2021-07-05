module ActiveAdminBootstrap
  module Extensions
    module Inputs
      module PasswordInput
        include Base
      end
    end
  end
end

module ActiveAdmin
  module Inputs
    class PasswordInput < ::Formtastic::Inputs::PasswordInput
      include ::ActiveAdminBootstrap::Extensions::Inputs::PasswordInput
    end
  end
end
