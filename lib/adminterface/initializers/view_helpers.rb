module Adminterface
  module Initializers
    module ViewHelpers
      extend ActiveSupport::Concern

      included do
        initializer "view_helpers.overrides" do |_app|
          require_relative("../extensions/view_helpers/alert_helper")
          require_relative("../extensions/view_helpers/component_helper")
        end
      end
    end
  end
end
