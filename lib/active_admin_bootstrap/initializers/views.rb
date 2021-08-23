module ActiveAdminBootstrap
  module Initializers
    module Views
      extend ActiveSupport::Concern

      included do
        config.before_configuration do |_app|
          require_relative("../extensions/views/action_items")
          require_relative("../extensions/views/columns")
          require_relative("../extensions/views/components/active_admin_form")
          require_relative("../extensions/views/components/attributes_table")
          require_relative("../extensions/views/components/blank_slate")
          require_relative("../extensions/views/components/comments")
          require_relative("../extensions/views/components/dropdown_menu")
          require_relative("../extensions/views/components/icon")
          require_relative("../extensions/views/components/index_list")
          require_relative("../extensions/views/components/menu_item")
          require_relative("../extensions/views/components/menu")
          require_relative("../extensions/views/components/paginated_collection")
          require_relative("../extensions/views/components/panel")
          require_relative("../extensions/views/components/scopes")
          require_relative("../extensions/views/components/sidebar_section")
          require_relative("../extensions/views/components/site_title")
          require_relative("../extensions/views/components/status_tag")
          require_relative("../extensions/views/components/table_for")
          require_relative("../extensions/views/components/tabs")
          require_relative("../extensions/views/footer")
          require_relative("../extensions/views/header")
          require_relative("../extensions/views/index_as_grid")
          require_relative("../extensions/views/index_as_table")
          require_relative("../extensions/views/pages/base")
          require_relative("../extensions/views/pages/form")
          require_relative("../extensions/views/pages/index")
          require_relative("../extensions/views/pages/page")
          require_relative("../extensions/views/title_bar")
        end
      end
    end
  end
end
