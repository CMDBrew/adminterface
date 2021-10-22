# Add SimpleCov for coverage reports
require "simplecov"
require "simplecov-console"
require "simplecov_json_formatter"

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(
  [
    SimpleCov::Formatter::HTMLFormatter,
    SimpleCov::Formatter::Console,
    SimpleCov::Formatter::JSONFormatter
  ]
)

SimpleCov.start :rails do
  add_filter "test"
  add_filter "lib/adminterface/version"
end

SimpleCov.minimum_coverage 85

# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require_relative "../test/dummy/config/environment"
ActiveRecord::Migrator.migrations_paths = [File.expand_path("../test/dummy/db/migrate", __dir__)]
ActiveRecord::Migrator.migrations_paths << File.expand_path("../db/migrate", __dir__)
require "rails/test_help"
require "minitest/autorun"
require "mocha/minitest"

Dir["#{ENGINE_ROOT}/test/support/**/*.rb"].sort.each { |f| require f }

# For generators
require "rails/generators/test_case"
require "generators/adminterface/comments/comments_generator"
require "generators/adminterface/configs/configs_generator"
require "generators/adminterface/install/install_generator"
require "generators/adminterface/views/views_generator"
require "generators/adminterface/webpacker/webpacker_generator"

# Load fixtures from the engine
if ActiveSupport::TestCase.respond_to?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path("fixtures", __dir__)
  ActionDispatch::IntegrationTest.fixture_path = ActiveSupport::TestCase.fixture_path
  ActiveSupport::TestCase.file_fixture_path = ActiveSupport::TestCase.fixture_path + "/files"
  ActiveSupport::TestCase.fixtures :all
end

class ActiveSupport::TestCase < Minitest::Test
  def assert_html(expected, actual)
    assert_equal unify_html(expected), unify_html(actual)
  end

  def unify_html(html)
    html.split("\n").map(&:strip).join.gsub(/\s+/, " ").gsub(/>\s+</, "><")
  end

  def escape_hash(hash)
    CGI.escapeHTML(hash.to_json)
  end

  def assert_array_includes(expected, actual)
    (expected - actual).empty?
  end
end
