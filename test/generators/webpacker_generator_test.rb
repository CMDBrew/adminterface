require "test_helper"

class WebpackerGeneratorTest < GeneratorTestCase
  tests Adminterface::Generators::WebpackerGenerator
  destination File.expand_path("../../tmp/dummy", __dir__)

  setup do
    build_app
    install_activeadmin
    say_yes!
  end

  teardown :teardown_app

  def stub_yarn!
    described_class.any_instance.expects(:run)
      .with(regexp_matches(/yarn add @cmdbrew\/adminterface/))
      .returns(true)
    described_class.any_instance.expects(:run)
      .with(regexp_matches(/yarn remove @activeadmin\/activeadmin/))
      .returns(true)
  end

  test "can specify version" do
    version = "1234"
    described_class.any_instance.stubs(:remove_activeadmin_dependencies).returns(true)
    described_class.any_instance.expects(:run)
      .with("yarn add @cmdbrew/adminterface@#{version}")
    run_generator ["-v", version]
  end

  test "installs webpacker if not already installed" do
    stub_yarn!
    described_class.any_instance.stubs(:webpacker_installed?).returns(false)
    described_class.any_instance.expects(:gem).with("webpacker")
    described_class.any_instance.expects(:rails_command).with("webpacker:install")
    run_generator
  end

  test "add resolve-loader to environment.js" do
    stub_yarn!
    run_generator

    assert_file "config/webpack/environment.js" do |content|
      assert_match(/loader: 'resolve-url-loader'/, content)
    end
  end

  test "installs adminterface" do
    described_class.any_instance.expects(:install_packages).returns(true)
    described_class.any_instance.expects(:remove_activeadmin_dependencies).returns(true)
    run_generator
  end

  test "replaces active_admin.js" do
    stub_yarn!
    run_generator

    assert_file "app/javascript/packs/active_admin.js" do |content|
      refute_match(/@activeadmin\/activeadmin/, content)
      assert_match(/@cmdbrew\/adminterface/, content)
    end
  end

  test "replaces active_admin.scss" do
    stub_yarn!
    run_generator

    assert_file "app/javascript/stylesheets/active_admin.scss" do |content|
      refute_match(/~@activeadmin\/activeadmin\/src\/scss\/mixins/, content)
      refute_match(/~@activeadmin\/activeadmin\/src\/scss\/base/, content)
      assert_match(/~@cmdbrew\/adminterface/, content)
    end
  end

  test "replaces print.scss" do
    stub_yarn!
    run_generator

    assert_file "app/javascript/packs/active_admin/print.scss" do |content|
      refute_match(/~@activeadmin\/activeadmin\/src\/scss\/print/, content)
      assert_match(/Keeping this file for activeadmin <= 2.9.0 backward compatibility./, content)
    end
  end

  test "enables webpacker for active_admin" do
    stub_yarn!
    run_generator

    assert_file "config/initializers/active_admin.rb" do |content|
      refute_match(/# config.use_webpacker = true/, content)
      assert_match(/config.use_webpacker = true/, content)
    end
  end

  test "removes activeadmin dependencies" do
    stub_yarn!
    run_generator

    assert_no_file "config/webpack/plugins/jquery.js"
    assert_file "config/webpack/environment.js" do |content|
      refute_match(/jquery/, content)
    end
  end

  test "shows readme" do
    stub_yarn!
    described_class.any_instance.stubs(:readme).with("README").returns(true)
    run_generator
  end
end
