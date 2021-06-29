module ActiveAdminBootstrap
  module Extensions
    module Inputs
      module SelectInput
        include Base

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
    class SelectInput < ::Formtastic::Inputs::SelectInput
      include ::ActiveAdminBootstrap::Extensions::Inputs::Base::Floatish
      include ::ActiveAdminBootstrap::Extensions::Inputs::SelectInput

      def to_floating_html
        input_wrapping do
          select_html << label_html
        end
      end
    end
  end
end
