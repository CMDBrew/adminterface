module ActiveAdmin
  # Overwrite NamespaceSettings - lib/active_admin/namespace_settings.rb
  class NamespaceSettings < DynamicSettingsNode
    CONFIGS = ActiveAdminBootstrap::Configs::DEFAULTS

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
