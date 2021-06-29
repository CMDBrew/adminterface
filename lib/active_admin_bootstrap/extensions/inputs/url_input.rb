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
      include ::ActiveAdminBootstrap::Extensions::Inputs::Base::Floatish
      include ::ActiveAdminBootstrap::Extensions::Inputs::UrlInput

      def to_floating_html
        input_wrapping do
          builder.url_field(method, input_html_options) <<
            label_html
        end
      end
    end
  end
end
