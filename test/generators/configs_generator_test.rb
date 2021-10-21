require "test_helper"

class ConfigsGeneratorTest < GeneratorTestCase
  tests Adminterface::Generators::ConfigsGenerator
  destination File.expand_path("../../tmp/dummy", __dir__)
  setup :build_app
  teardown :teardown_app

  test "copies configuration files" do
    run_generator

    assert_file "config/adminterface/admin/components.yml"
    assert_file "config/adminterface/admin/css_classes.yml"
  end

  test "copies configuration files in a directory" do
    run_generator %w[admin/users]

    assert_file "config/adminterface/admin/users/components.yml"
    assert_file "config/adminterface/admin/users/css_classes.yml"
  end

  test "shows readme" do
    described_class.any_instance.stubs(:readme).with("README").returns(true)
    run_generator
  end
end
