module ActiveAdminBootstrap
  module Extensions
    module SidebarSection
      def initialize(*args, &block)
        options = args.extract_options!
        name = args.first
        @position = options[:position]&.to_s
        super(name, options, &block)
      end

      def id
        return if name.blank?

        super
      end

      def title
        return if name.blank?

        super
      end

      def partial_name
        return options[:partial] if name.blank?

        super
      end
    end
  end
end

ActiveAdmin::SidebarSection.class_eval do
  prepend ActiveAdminBootstrap::Extensions::SidebarSection
  attr_accessor :position
end
