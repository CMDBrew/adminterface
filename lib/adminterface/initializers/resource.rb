module Adminterface
  module Initializers
    module Resource
      extend ActiveSupport::Concern

      included do
        config.before_configuration do |_app|
          require_relative("../extensions/dsl")
          require_relative("../extensions/menu_item")
          require_relative("../extensions/resource/action_items")
          require_relative("../extensions/sidebar_section")
        end

        initializer "active_admin.controllers" do
          require_relative("../extensions/base_controller")
        end
      end
    end
  end
end
