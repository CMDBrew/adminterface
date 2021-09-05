module Adminterface
  module Extensions
    module Views
      module Footer
        def default_class_name
          "#{super} #{footer_css_classes[:wrapper]}".squish
        end

        def para(message)
          super(message, class: footer_css_classes[:body])
        end

        def powered_by_message
          I18n.t("active_admin.powered_by",
            active_admin: link_to("Adminterface", "https://github.com/CMDBrew/adminterface", target: "_blank", rel: "noopener"),
            version: Adminterface::VERSION).html_safe
        end
      end
    end
  end
end

# Overwrite activeadmin/lib/active_admin/views/header.rb
ActiveAdmin::Views::Footer.class_eval do
  prepend Adminterface::Extensions::Views::Footer
  has_css_classes_for :footer
end
