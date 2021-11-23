require "activeadmin"
require "rainbow"
require "httparty"

# Adminterface main file
module Adminterface
  autoload :VERSION, "adminterface/version"
  autoload :Configs, "adminterface/configs"
  autoload :Data, "adminterface/data"
  autoload :Callable, "adminterface/callable"

  # Load Initializers
  module Initializers
    autoload :BatchActions, "adminterface/initializers/batch_actions"
    autoload :Comments, "adminterface/initializers/comments"
    autoload :Configurations, "adminterface/initializers/configurations"
    autoload :Formtastic, "adminterface/initializers/formtastic"
    autoload :Resource, "adminterface/initializers/resource"
    autoload :ViewHelpers, "adminterface/initializers/view_helpers"
    autoload :Views, "adminterface/initializers/views"
  end
end

require "adminterface/engine"
