module ActiveAdminBootstrap
  module Extensions
    module Inputs
      module PasswordInput
        include Base
        include Base::Stringish
        prepend Base::Groupish

        def input_html
          builder.password_field(method, input_html_options)
        end
      end
    end
  end
end

module ActiveAdmin
  module Inputs
    class PasswordInput < ::Formtastic::Inputs::PasswordInput
      include ::ActiveAdminBootstrap::Extensions::Inputs::PasswordInput
    end
  end
end
