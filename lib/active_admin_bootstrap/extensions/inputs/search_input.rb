module ActiveAdminBootstrap
  module Extensions
    module Inputs
      module SearchInput
        include Base
      end
    end
  end
end

module ActiveAdmin
  module Inputs
    class SearchInput < ::Formtastic::Inputs::SearchInput
      include ::ActiveAdminBootstrap::Extensions::Inputs::Base::Floatish
      include ::ActiveAdminBootstrap::Extensions::Inputs::SearchInput

      def to_floating_html
        input_wrapping do
          builder.search_field(method, input_html_options) <<
            label_html
        end
      end
    end
  end
end
