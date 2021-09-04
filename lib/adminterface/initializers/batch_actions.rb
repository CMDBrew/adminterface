module Adminterface
  module Initializers
    module BatchActions
      extend ActiveSupport::Concern

      included do
        ActiveAdmin.before_load do |_app|
          require_relative("../extensions/batch_actions/resource_extension")
          require_relative("../extensions/batch_actions/views/batch_action_selector")
          require_relative("../extensions/batch_actions/views/selection_cells")
        end
      end
    end
  end
end
