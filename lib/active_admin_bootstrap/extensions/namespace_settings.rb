module ActiveAdminBootstrap
  module Extensions
    module NamespaceSettings
      extend ActiveSupport::Concern

      CONFIGS = ActiveAdminBootstrap::Configs::DEFAULTS

      included do
        # The default layouts
        register :layouts, CONFIGS[:layouts]

        # The default icons
        register :icons, CONFIGS[:icons]

        # The default component configs
        register :components, CONFIGS[:components]

        # The default css_classes
        register :css_classes, CONFIGS[:css_classes]

        # The default breakpoints
        register :breakpoints, CONFIGS[:breakpoints]
      end
    end
  end
end

# Overwrite activeadmin/lib/active_admin/namespace_settings.rb
ActiveAdmin::NamespaceSettings.class_eval do
  include ActiveAdminBootstrap::Extensions::NamespaceSettings
end
