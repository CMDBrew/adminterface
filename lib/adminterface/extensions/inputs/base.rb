require_relative("./base/active_admin_config")
require_relative("./base/html")
require_relative("./base/labelling")
require_relative("./base/wrapping")
require_relative("./base/pluginish")

module Adminterface
  module Extensions
    module Inputs
      module Base
        include Html
        include Labelling
        include Wrapping
        include Pluginish
        include ActiveAdminConfig
      end
    end
  end
end
