module ActiveAdminBootstrap
  module Extensions
    module Formtastic
      module Inputs
        module Base
          module Choices
            def legend_html
              if render_label?
                template.content_tag(:label, label_text)
              else
                "".html_safe
              end
            end
          end
        end
      end
    end
  end
end

# Overwrite formtastic/lib/formtastic/inputs/base/choices.rb
Formtastic::Inputs::Base::Choices.module_eval do
  prepend ActiveAdminBootstrap::Extensions::Formtastic::Inputs::Base::Choices
end
