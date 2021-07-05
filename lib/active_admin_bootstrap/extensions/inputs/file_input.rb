module ActiveAdmin
  module Inputs
    class FileInput < ::Formtastic::Inputs::FileInput
      include ::ActiveAdminBootstrap::Extensions::Inputs::Base
    end
  end
end
