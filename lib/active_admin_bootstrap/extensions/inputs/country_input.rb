module ActiveAdminBootstrap
  module Extensions
    module Inputs
      module CountryInput
        include Base
        prepend Base::Groupish

        def to_html
          input_wrapping do
            label_html << input_html
          end
        end

        def input_html
          builder.country_select(method, priority_countries, input_options, input_html_options)
        end

        def input_html_options
          opts = options[:input_html] || {}
          super.merge(class: "form-select #{opts[:class]}".squish)
        end
      end
    end
  end
end

module ActiveAdmin
  module Inputs
    class CountryInput < ::Formtastic::Inputs::CountryInput
      include ::ActiveAdminBootstrap::Extensions::Inputs::CountryInput
    end
  end
end
