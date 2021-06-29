require_relative("./text_input")

module ActiveAdmin
  module Inputs
    class RichTextInput < TextInput
      include ::ActiveAdminBootstrap::Extensions::Inputs::Base

      def input_html_options
        opts = super
        opts.merge(class: "trix-content #{opts[:class]}".squish)
      end

      def to_html
        input_wrapping do
          label_html <<
            builder.rich_text_area(method, input_html_options)
        end
      end
    end
  end
end
