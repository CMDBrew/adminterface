module ActiveAdminBootstrap
  module Extensions
    module ViewHelpers
      module ComponentHelper
        def site_title(namespace)
          Arbre::Context.new({}, self) do
            site_title namespace, false
          end.content
        end

        def footer(namespace)
          Arbre::Context.new({}, self) do
            footer namespace
          end.content
        end
      end
    end
  end
end

ActiveAdmin::ViewHelpers.module_eval do
  prepend ActiveAdminBootstrap::Extensions::ViewHelpers::ComponentHelper
end
