require_relative("./select_input")

module ActiveAdmin
  module Inputs
    class TomSelectInput < SelectInput
      include ::ActiveAdminBootstrap::Extensions::Inputs::Base

      # @TODO: allow modifying js configs
      def input_html_options
        super.merge(data: {"aa-tom-select": {}})
      end
    end
  end
end
