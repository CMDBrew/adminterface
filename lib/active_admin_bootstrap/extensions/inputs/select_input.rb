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
      include ::ActiveAdminBootstrap::Extensions::Inputs::SelectInput
    end
  end
end
