module ActiveAdmin
  module Inputs
    class FileInput < ::Formtastic::Inputs::FileInput
      include ::ActiveAdminBootstrap::Extensions::Inputs::Base
      prepend ::ActiveAdminBootstrap::Extensions::Inputs::Base::Groupish

      # @TODO: use custom component so we can change the translations in I18n YAML files
      def to_html
        input_wrapping do
          label_html << input_html
        end
      end

      def input_html
        builder.file_field(method, input_html_options)
      end
    end
  end
end
