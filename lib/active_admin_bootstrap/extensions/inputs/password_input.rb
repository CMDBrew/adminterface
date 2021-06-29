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
      include ::ActiveAdminBootstrap::Extensions::Inputs::Base::Floatish
      include ::ActiveAdminBootstrap::Extensions::Inputs::PasswordInput

      def to_floating_html
        input_wrapping do
          builder.password_field(method, input_html_options) <<
            label_html
        end
      end
    end
  end
end
