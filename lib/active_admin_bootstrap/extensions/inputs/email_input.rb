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
      include ::ActiveAdminBootstrap::Extensions::Inputs::Base::Floatish
      include ::ActiveAdminBootstrap::Extensions::Inputs::EmailInput

      def to_floating_html
        input_wrapping do
          builder.email_field(method, input_html_options) <<
            label_html
        end
      end
    end
  end
end
