module ActiveAdminBootstrap
  module Extensions
    module Inputs
      module ColorInput
        include Base

        def input_html_options
          opts = super
          opts[:class] = "#{opts[:class]} form-control-color".squish
          opts
        end
      end
    end
  end
end

module ActiveAdmin
  module Inputs
    class ColorInput < ::Formtastic::Inputs::ColorInput
      include ::ActiveAdminBootstrap::Extensions::Inputs::ColorInput
    end
  end
end
