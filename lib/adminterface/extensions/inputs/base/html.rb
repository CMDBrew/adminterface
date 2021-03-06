module Adminterface
  module Extensions
    module Inputs
      module Base
        module Html
          def input_html_options
            options = super
            options[:class] = "#{options[:class]} form-control".squish
            options.merge(plugins_options)
          end
        end
      end
    end
  end
end
