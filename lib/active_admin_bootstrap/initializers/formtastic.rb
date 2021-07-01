module ActiveAdminBootstrap
  module Initializers
    module Formtastic
      extend ActiveSupport::Concern

      included do
        initializer "base" do |_app|
          require_relative("../extensions/form_builder")
          require_relative("../extensions/inputs/base")
          require_relative("../extensions/inputs/base/choices")
          require_relative("../extensions/inputs/base/floatish")
        end

        initializer "inputs" do |_app|
          require_relative("../extensions/inputs/boolean_input")
          require_relative("../extensions/inputs/check_boxes_input")
          require_relative("../extensions/inputs/color_input")
          require_relative("../extensions/inputs/datalist_input")
          require_relative("../extensions/inputs/date_picker_input")
          require_relative("../extensions/inputs/datetime_picker_input")
          require_relative("../extensions/inputs/email_input")
          require_relative("../extensions/inputs/number_input")
          require_relative("../extensions/inputs/password_input")
          require_relative("../extensions/inputs/phone_input")
          require_relative("../extensions/inputs/radio_input")
          require_relative("../extensions/inputs/range_input")
          require_relative("../extensions/inputs/rich_text_input")
          require_relative("../extensions/inputs/search_input")
          require_relative("../extensions/inputs/select_input")
          require_relative("../extensions/inputs/string_input")
          require_relative("../extensions/inputs/switch_input")
          require_relative("../extensions/inputs/text_input")
          require_relative("../extensions/inputs/time_picker_input")
          require_relative("../extensions/inputs/tom_select_input")
          require_relative("../extensions/inputs/url_input")
        end

        initializer "filters" do |_app|
          require_relative("../extensions/filters/forms")
          require_relative("../extensions/inputs/filters/base")
          require_relative("../extensions/inputs/filters/base/search_method_select")
          require_relative("../extensions/inputs/filters/boolean_input")
          require_relative("../extensions/inputs/filters/check_boxes_input")
          require_relative("../extensions/inputs/filters/date_picker_input")
          require_relative("../extensions/inputs/filters/date_range_input")
          require_relative("../extensions/inputs/filters/select_input")
        end
      end
    end
  end
end