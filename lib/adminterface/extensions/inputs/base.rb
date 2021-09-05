require_relative("./base/active_admin_config")
require_relative("./base/html")
require_relative("./base/labelling")
require_relative("./base/wrapping")

module Adminterface
  module Extensions
    module Inputs
      module Base
        include Html
        include Labelling
        include Wrapping
        include ActiveAdminConfig
      end
    end
  end
end
