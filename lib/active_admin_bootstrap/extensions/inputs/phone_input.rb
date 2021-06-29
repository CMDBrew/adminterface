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
      include ::ActiveAdminBootstrap::Extensions::Inputs::Base::Floatish
      include ::ActiveAdminBootstrap::Extensions::Inputs::PhoneInput

      def to_floating_html
        input_wrapping do
          builder.phone_field(method, input_html_options) <<
            label_html
        end
      end
    end
  end
end
