module Adminterface
  module Extensions
    module Views
      module Pages
        module Page
          def body_classes
            super.add "page"
          end
        end
      end
    end
  end
end

# Overwrite activeadmin/lib/active_admin/views/pages/page.rb
ActiveAdmin::Views::Pages::Page.class_eval do
  prepend Adminterface::Extensions::Views::Pages::Page
end
