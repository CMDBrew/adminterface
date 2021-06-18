module ActiveAdmin
  module Views
    module Pages
      # Overwrite activeadmin/lib/active_admin/views/pages/page.rb
      class Page < Base
        def body_classes
          super.add "page"
        end
      end
    end
  end
end
