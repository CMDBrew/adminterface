module Adminterface
  module Extensions
    module Inputs
      module UrlInput
        include Base
        include Base::Stringish
        prepend Base::Groupish

        def input_html
          builder.url_field(method, input_html_options)
        end
      end
    end
  end
end

module ActiveAdmin
  module Inputs
    class UrlInput < ::Formtastic::Inputs::UrlInput
      include ::Adminterface::Extensions::Inputs::UrlInput
    end
  end
end
