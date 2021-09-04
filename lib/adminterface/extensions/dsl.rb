module Adminterface
  module Extensions
    module DSL
      def sidebar(...)
        config.sidebar_sections << ActiveAdmin::SidebarSection.new(...)
      end
    end
  end
end

ActiveAdmin::DSL.class_eval do
  prepend Adminterface::Extensions::DSL
end
