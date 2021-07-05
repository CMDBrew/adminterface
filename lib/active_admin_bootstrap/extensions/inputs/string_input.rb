module ActiveAdminBootstrap
  module Extensions
    module Inputs
      module StringInput
        include Base
      end
    end
  end
end

module ActiveAdmin
  module Inputs
    class StringInput < ::Formtastic::Inputs::StringInput
      include ::ActiveAdminBootstrap::Extensions::Inputs::StringInput
    end
  end
end
