require_relative("./base/html")
require_relative("./base/labelling")
require_relative("./base/wrapping")

module ActiveAdminBootstrap
  module Extensions
    module Inputs
      module Base
        include Html
        include Labelling
        include Wrapping
      end
    end
  end
end
