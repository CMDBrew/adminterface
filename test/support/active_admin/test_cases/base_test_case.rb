class ActiveAdmin::BaseTestCase < ActiveSupport::TestCase
  include ActiveAdmin::IntegrationTestHelper
  include ActiveAdmin::NamespaceTestHelper

  teardown do
    ActiveAdmin.unload!
    Rails.cache.clear
  end
end
