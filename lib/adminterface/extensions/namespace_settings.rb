module Adminterface
  module Extensions
    module NamespaceSettings
      extend ActiveSupport::Concern

      CONFIGS = Adminterface::Configs::DEFAULTS

      included do
        # The default component configs
        register :components, CONFIGS[:components]

        # The default css_classes
        register :css_classes, CONFIGS[:css_classes]

        # Comments
        register :comments_pager, {window: 2}
        register :comments_per_page, 30
        register :comments_input, :text

        # Resource
        register :pager, {window: 2}

        # Set the site title image displayed in the logged_out layout (has precendence over :site_title)
        register :site_title_image_logged_out, "", :string_symbol_or_proc
      end
    end
  end
end

# Overwrite activeadmin/lib/active_admin/namespace_settings.rb
ActiveAdmin::NamespaceSettings.class_eval do
  include Adminterface::Extensions::NamespaceSettings
end