require "test_helper"

class ActiveAdminBootstrapTest < ActiveSupport::TestCase
  test "it has a version number" do
    assert ActiveAdminBootstrap::VERSION
  end

  test "ensures npm version matches with ruby version" do
    npm_version = JSON.parse(File.read("#{ENGINE_ROOT}/package.json"))["version"]
    assert_equal ActiveAdminBootstrap::VERSION, npm_version
  end
end
