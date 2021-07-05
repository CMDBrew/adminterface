module ActiveAdminBootstrap
  module Extensions
    module Inputs
      module SearchInput
        include Base
      end
    end
  end
end

module ActiveAdmin
  module Inputs
    class SearchInput < ::Formtastic::Inputs::SearchInput
      include ::ActiveAdminBootstrap::Extensions::Inputs::SearchInput
    end
  end
end
