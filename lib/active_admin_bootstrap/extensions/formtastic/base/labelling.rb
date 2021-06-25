module ActiveAdminBootstrap
  module Extensions
    module Formtastic
      module Inputs
        module Base
          module Labelling
            def label_html_options
              options = super
              options[:class] = "#{options[:class]} form-label".squish
              options
            end
          end
        end
      end
    end
  end
end

# Overwrite formtastic/lib/formtastic/inputs/base/labelling.rb
Formtastic::Inputs::Base::Labelling.module_eval do
  prepend ActiveAdminBootstrap::Extensions::Formtastic::Inputs::Base::Labelling
end
