require "test_helper"

class CommentsGeneratorTest < GeneratorTestCase
  tests Adminterface::Generators::CommentsGenerator
  destination File.expand_path("../../tmp/dummy", __dir__)
  setup :build_app
  teardown :teardown_app

  def stub_action_text_installation
    described_class.any_instance.stubs(:invoke).with("action_text:install").returns(true)
  end

  test "installs action text" do
    stub_action_text_installation
    run_generator
  end

  test "copies the migration file" do
    stub_action_text_installation
    ActiveRecord::Migration.stubs(:next_migration_number).returns("TIMES_STAMP")
    run_generator

    assert_file "db/migrate/TIMES_STAMP_drop_body_for_active_admin_comments.rb" do |content|
      assert_match(/class DropBodyForActiveAdminComments/, content)
    end
  end

  test "copies the initializer file" do
    stub_action_text_installation
    run_generator

    assert_file "config/initializers/active_admin_comment_action_text.rb" do |content|
      assert_match(/ActiveAdmin::Comment.send :include, Adminterface::ActionTextComment/, content)
    end
  end

  test "shows readme" do
    stub_action_text_installation
    described_class.any_instance.stubs(:readme).with("README").returns(true)
    run_generator
  end
end
