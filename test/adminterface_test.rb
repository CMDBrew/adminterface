require "test_helper"

class AdminterfaceTest < ActiveSupport::TestCase
  test "it has a version number" do
    assert Adminterface::VERSION
  end

  test "ensures npm version matches with ruby version" do
    npm_version = JSON.parse(File.read("#{ENGINE_ROOT}/package.json"))["version"]
    assert_equal Adminterface::VERSION, npm_version
  end
end
