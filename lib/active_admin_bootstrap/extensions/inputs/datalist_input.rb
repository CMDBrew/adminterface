module ActiveAdminBootstrap
  module Extensions
    module Inputs
      module DatalistInput
        include Base
      end
    end
  end
end

module ActiveAdmin
  module Inputs
    class DatalistInput < ::Formtastic::Inputs::DatalistInput
      include ::ActiveAdminBootstrap::Extensions::Inputs::Base::Floatish
      include ::ActiveAdminBootstrap::Extensions::Inputs::DatalistInput

      def to_floating_html
        @name = input_html_options[:id].gsub(/_id$/, "")
        input_wrapping do
          builder.text_field(method, input_html_options) <<
            label_html <<
            data_list_html
        end
      end
    end
  end
end
