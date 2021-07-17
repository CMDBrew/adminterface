module ActiveAdminBootstrap
  module Extensions
    module Inputs
      module TimeZoneInput
        include Base
        prepend Base::Groupish

        def to_html
          input_wrapping do
            label_html << input_html
          end
        end

        def input_html
          builder.time_zone_select(method, priority_zones, input_options, input_html_options)
        end

        def input_html_options
          opts = options[:input_html] || {}
          super.merge(class: "form-select #{opts[:class]}".squish)
        end
      end
    end
  end
end

module ActiveAdmin
  module Inputs
    class TimeZoneInput < ::Formtastic::Inputs::TimeZoneInput
      include ::ActiveAdminBootstrap::Extensions::Inputs::TimeZoneInput
    end
  end
end
