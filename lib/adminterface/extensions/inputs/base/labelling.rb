module Adminterface
  module Extensions
    module Inputs
      module Base
        module Labelling
          def label_html_options
            opts = super
            opts[:class].push "form-label"
            opts
          end
        end
      end
    end
  end
end
