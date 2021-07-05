module ActiveAdminBootstrap
  module Extensions
    module Inputs
      module UrlInput
        include Base
      end
    end
  end
end

module ActiveAdmin
  module Inputs
    class UrlInput < ::Formtastic::Inputs::UrlInput
      include ::ActiveAdminBootstrap::Extensions::Inputs::UrlInput
    end
  end
end
