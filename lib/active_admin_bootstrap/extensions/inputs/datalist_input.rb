module ActiveAdminBootstrap
  module Extensions
    module Inputs
      module DatalistInput
        include Base
        include Base::Stringish
        prepend Base::Groupish

        def to_html
          @name = input_html_options[:id].gsub(/_id$/, "")
          input_wrapping do
            label_html << input_html << data_list_html
          end
        end
      end
    end
  end
end

module ActiveAdmin
  module Inputs
    class DatalistInput < ::Formtastic::Inputs::DatalistInput
      include ::ActiveAdminBootstrap::Extensions::Inputs::DatalistInput
    end
  end
end
