require "activeadmin"
require "rainbow"
require "httparty"

# Adminterface main file
module Adminterface
  autoload :VERSION, "adminterface/version"
  autoload :Configs, "adminterface/configs"
  autoload :Data, "adminterface/data"
  autoload :License, "adminterface/license"
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

  module Licensing
    autoload :Notice, "adminterface/licensing/notice"
    autoload :Commercial, "adminterface/licensing/commercial"
    autoload :Personal, "adminterface/licensing/personal"
  end

  module Encryption
    autoload :Encryptor, "adminterface/encryption/encryptor"
  end

  # License key
  mattr_accessor :license_key
  @@license_key = nil

  def self.setup
    yield self
  end

  def self.rails6_and_up?
    Rails::VERSION::MAJOR >= 6
  end

  def self.cache_store
    if Rails.cache.instance_of?(ActiveSupport::Cache::NullStore)
      ActiveSupport::Cache::MemoryStore.new
    else
      Rails.cache
    end
  end
end

require "adminterface/engine"
