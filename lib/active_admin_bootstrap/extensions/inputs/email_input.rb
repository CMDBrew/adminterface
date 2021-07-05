module ActiveAdminBootstrap
  module Extensions
    module Inputs
      module EmailInput
        include Base
      end
    end
  end
end

module ActiveAdmin
  module Inputs
    class EmailInput < ::Formtastic::Inputs::EmailInput
      include ::ActiveAdminBootstrap::Extensions::Inputs::EmailInput
    end
  end
end
