module ActiveAdminBootstrap
  module Extensions
    module Inputs
      module DatalistInput
        include Base
      end
    end
  end
end

module ActiveAdmin
  module Inputs
    class DatalistInput < ::Formtastic::Inputs::DatalistInput
      include ::ActiveAdminBootstrap::Extensions::Inputs::DatalistInput
    end
  end
end
