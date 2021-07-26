module ActiveAdminBootstrap
  module Extensions
    module Inputs
      module Base
        module Html
          def input_html_options
            options = super
            options[:class] = "#{options[:class]} form-control".squish
            options
          end
        end
      end
    end
  end
end
