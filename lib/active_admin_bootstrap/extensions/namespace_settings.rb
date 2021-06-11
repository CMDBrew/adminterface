module ActiveAdmin
  # Overwrite NamespaceSettings - lib/active_admin/namespace_settings.rb
  class NamespaceSettings < DynamicSettingsNode
    CONFIGS = ActiveAdminBootstrap::CONFIGS

    # The default site_title content
    register :site_title_proc, nil

    # The default layout
    register :layouts, CONFIGS[:layouts]

    # The default component configs
    register :components, CONFIGS[:components]

    # The default css_class
    register :css_classes, CONFIGS[:css_classes]

    # The default breakpoints
    register :breakpoints, CONFIGS[:breakpoints]
  end
end
