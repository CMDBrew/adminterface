module ActiveAdminBootstrap
  module Extensions
    module Inputs
      module EmailInput
        include Base
        include Base::Stringish
        prepend Base::Groupish

        def input_html
          builder.email_field(method, input_html_options)
        end
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
