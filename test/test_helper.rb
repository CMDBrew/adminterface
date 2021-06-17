# Add SimpleCov for coverage reports
require "simplecov"

SimpleCov.start :rails do
  add_filter "test"
end

SimpleCov.minimum_coverage 90

# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require_relative "../test/dummy/config/environment"
ActiveRecord::Migrator.migrations_paths = [File.expand_path("../test/dummy/db/migrate", __dir__)]
ActiveRecord::Migrator.migrations_paths << File.expand_path("../db/migrate", __dir__)
require "rails/test_help"

# Load fixtures from the engine
if ActiveSupport::TestCase.respond_to?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path("fixtures", __dir__)
  ActionDispatch::IntegrationTest.fixture_path = ActiveSupport::TestCase.fixture_path
  ActiveSupport::TestCase.file_fixture_path = ActiveSupport::TestCase.fixture_path + "/files"
  ActiveSupport::TestCase.fixtures :all
end

# Base class for testing ActiveAdmin
require "supports/active_admin/integration_test_helper"
require "supports/active_admin/namespace_test_helper"

class ActiveSupport::TestCase < Minitest::Test
  def assert_html(expected, actual)
    assert_equal unify_html(expected), unify_html(actual)
  end

  def unify_html(html)
    html.split("\n").map(&:strip).join.gsub(/>\s+</, "><")
  end
end

class ActiveAdminTest < ActiveSupport::TestCase
  include ActiveAdmin::IntegrationTestHelper
  include ActiveAdmin::NamespaceTestHelper
end
