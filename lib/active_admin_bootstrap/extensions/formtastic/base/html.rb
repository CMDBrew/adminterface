module ActiveAdminBootstrap
  module Extensions
    module Formtastic
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
end

# Overwrite formtastic/lib/formtastic/inputs/base/html.rb
Formtastic::Inputs::Base::Html.module_eval do
  prepend ActiveAdminBootstrap::Extensions::Formtastic::Inputs::Base::Html
end
