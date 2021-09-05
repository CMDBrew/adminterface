module Adminterface
  module Extensions
    module Inputs
      module PhoneInput
        include Base
        include Base::Stringish
        prepend Base::Groupish

        def input_html
          builder.phone_field(method, input_html_options)
        end
      end
    end
  end
end

module ActiveAdmin
  module Inputs
    class PhoneInput < ::Formtastic::Inputs::PhoneInput
      include ::Adminterface::Extensions::Inputs::PhoneInput
    end
  end
end
