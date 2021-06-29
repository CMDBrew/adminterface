module ActiveAdminBootstrap
  module Extensions
    module Inputs
      module RangeInput
        include Base

        def input_html_options
          opts = options[:input_html] || {}
          super.merge(class: "form-range #{opts[:class]}".squish)
        end
      end
    end
  end
end

module ActiveAdmin
  module Inputs
    class RangeInput < ::Formtastic::Inputs::RangeInput
      include ::ActiveAdminBootstrap::Extensions::Inputs::RangeInput
    end
  end
end
