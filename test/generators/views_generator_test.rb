require "test_helper"

class ViewsGeneratorTest < GeneratorTestCase
  tests Adminterface::Generators::ViewsGenerator
  destination File.expand_path("../../tmp/dummy", __dir__)
  setup :build_app
  teardown :teardown_app

  test "copies view files" do
    run_generator

    assert_directory "app/views/active_admin"
    assert_directory "app/views/kaminari/active_admin"
    assert_file "app/views/layouts/active_admin_logged_out.html.erb"
  end
end
