module ActiveAdminBootstrap
  module Initializers
    module Resource
      extend ActiveSupport::Concern

      included do
        config.before_configuration do |_app|
          require_relative("../extensions/resource/action_items")
          require_relative("../extensions/resource/menu_item")
        end
      end
    end
  end
end
