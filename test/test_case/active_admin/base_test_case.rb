require "test_helper"
require "support/active_admin/integration_test_helper"
require "support/active_admin/namespace_test_helper"

class ActiveAdmin::BaseTestCase < ActiveSupport::TestCase
  include ActiveAdmin::IntegrationTestHelper
  include ActiveAdmin::NamespaceTestHelper

  teardown do
    ActiveAdmin.unload!
    Rails.cache.clear
  end
end
