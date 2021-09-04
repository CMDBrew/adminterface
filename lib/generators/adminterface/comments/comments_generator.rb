module Adminterface
  module Generators
    class CommentsGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      desc "Generate action_text migrations and initializers for ActiveAdmin::Comment"
      source_root File.expand_path("templates", __dir__)

      def self.next_migration_number(dirname)
        next_migration_number = current_migration_number(dirname) + 1
        ActiveRecord::Migration.next_migration_number(next_migration_number)
      end

      def create_initializer
        template "active_admin_comment_action_text.rb",
          "config/initializers/active_admin_comment_action_text.rb"
      end

      def create_migrations
        migration_template "migrations/drop_body_for_active_admin_comments.rb.erb",
          "db/migrate/drop_body_for_active_admin_comments.rb"
      end

      def show_readme
        readme "README" if behavior == :invoke
      end
    end
  end
end
