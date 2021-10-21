require "test_helper"

class InstallGeneratorTest < GeneratorTestCase
  tests Adminterface::Generators::InstallGenerator
  destination File.expand_path("../../tmp/dummy", __dir__)
  setup :build_app
  teardown :teardown_app

  test "adds examples" do
    described_class.any_instance.stubs(:install_assets).returns(true)
    described_class.any_instance.stubs(:install_action_text_for_comments).returns(true)
    described_class.any_instance
      .expects(:template).with("dashboard.rb", "app/admin/dashboard.rb")

    run_generator
  end

  test "can skip examples" do
    described_class.any_instance.stubs(:install_assets).returns(true)
    described_class.any_instance.stubs(:install_action_text_for_comments).returns(true)
    described_class.any_instance
      .expects(:template).with("dashboard.rb", "app/admin/dashboard.rb")
      .never

    run_generator %w[--skip_examples]
  end

  test "calls webpacker, comments generators by default" do
    described_class.any_instance
      .expects(:generate).with("adminterface:comments")
    described_class.any_instance
      .expects(:generate).with(regexp_matches(/adminterface:webpacker/))

    run_generator
  end

  test "can skip action_text" do
    described_class.any_instance.stubs(:install_assets).returns(true)
    described_class.any_instance.stubs(:add_examples).returns(true)
    described_class.any_instance
      .expects(:generate).with("adminterface:comments").never
    run_generator %w[--skip_action_text]
  end

  test "can skip webpacker" do
    described_class.any_instance.stubs(:install_action_text_for_comments).returns(true)
    described_class.any_instance.stubs(:add_examples).returns(true)
    described_class.any_instance
      .expects(:generate).with(regexp_matches(/adminterface:webpacker/))
      .never
    run_generator %w[--webpacker false]
  end

  test "can specify version" do
    version = "1234"
    described_class.any_instance.stubs(:install_action_text_for_comments).returns(true)
    described_class.any_instance.stubs(:add_examples).returns(true)
    described_class.any_instance
      .expects(:generate).with("adminterface:webpacker -v #{version}")
    run_generator ["-v", version]
  end
end
