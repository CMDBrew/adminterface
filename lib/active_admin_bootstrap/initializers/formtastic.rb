module ActiveAdminBootstrap
  module Initializers
    module Formtastic
      extend ActiveSupport::Concern

      included do
        initializer "formtastic.base" do |_app|
          require_relative("../extensions/formtastic/base/choices")
          require_relative("../extensions/formtastic/base/html")
          require_relative("../extensions/formtastic/base/labelling")
          require_relative("../extensions/formtastic/base/wrapping")
        end

        initializer "formtastic.inputs" do |_app|
          require_relative("../extensions/formtastic/inputs/check_boxes_input")
        end

        initializer "active_admin.filters" do |_app|
          require_relative("../extensions/filters/forms")
          require_relative("../extensions/inputs/filters/base/search_method_select")
          require_relative("../extensions/inputs/filters/date_range_input")
        end
      end
    end
  end
end
