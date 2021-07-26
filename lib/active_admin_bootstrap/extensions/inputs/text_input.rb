module ActiveAdminBootstrap
  module Extensions
    module Inputs
      module TextInput
        include Base
      end
    end
  end
end

module ActiveAdmin
  module Inputs
    class TextInput < ::Formtastic::Inputs::TextInput
      include ::ActiveAdminBootstrap::Extensions::Inputs::TextInput
    end
  end
end
