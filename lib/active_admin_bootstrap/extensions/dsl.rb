module ActiveAdminBootstrap
  module Extensions
    module DSL
      def sidebar(...)
        config.sidebar_sections << ActiveAdmin::SidebarSection.new(...)
      end
    end
  end
end

ActiveAdmin::DSL.class_eval do
  prepend ActiveAdminBootstrap::Extensions::DSL
end
