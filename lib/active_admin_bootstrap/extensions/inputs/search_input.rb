module ActiveAdminBootstrap
  module Extensions
    module Inputs
      module SearchInput
        include Base
        include Base::Stringish
        prepend Base::Groupish

        def input_html
          builder.search_field(method, input_html_options)
        end
      end
    end
  end
end

module ActiveAdmin
  module Inputs
    class SearchInput < ::Formtastic::Inputs::SearchInput
      include ::ActiveAdminBootstrap::Extensions::Inputs::SearchInput
    end
  end
end
