class CreateActiveAdminComments < ActiveRecord::Migration[6.1]
  def self.up
    create_table :active_admin_comments do |t|
      t.string :namespace
      t.text :body
      t.references :resource, polymorphic: true, type: :bigint
      t.references :author, polymorphic: true, type: :bigint
      t.timestamps
    end
    add_index :active_admin_comments, [:namespace]
  end

  def self.down
    drop_table :active_admin_comments
  end
end
