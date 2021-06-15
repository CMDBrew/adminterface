module ActiveAdmin
  # Overwrite Resource - activeadmin/lib/active_admin/resource.rb
  class Resource
    attr_writer :layouts, :icons, :components, :css_classes, :breakpoints

    def layouts
      namespace.layouts.deep_merge(@layouts || {})
    end

    def icons
      namespace.icons.deep_merge(@icons || {})
    end

    def components
      namespace.components.deep_merge(@components || {})
    end

    def css_classes
      namespace.css_classes.deep_merge(@css_classes || {})
    end

    def breakpoints
      namespace.breakpoints.deep_merge(@breakpoints || {})
    end
  end
end
