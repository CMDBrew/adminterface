# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[6.1]
  def up
    change_table :users do |t|
      ## Database authenticatable
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      t.string :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      # Uncomment below if timestamps were not included in your original model.
      # t.timestamps null: false
    end

    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end

  def down
    remove_index :users, :email
    remove_index :users, :reset_password_token
    # remove_index :users, :confirmation_token
    # remove_index :users, :unlock_token

    ## Database authenticatable
    remove_column :users, :email
    remove_column :users, :encrypted_password, :string, null: false, default: ""

    ## Recoverable
    remove_column :users, :reset_password_token, :string
    remove_column :users, :reset_password_sent_at, :datetime

    ## Rememberable
    remove_column :users, :remember_created_at, :datetime

    ## Trackable
    # remove_column :users, :sign_in_count, :integer, default: 0, null: false
    # remove_column :users, :current_sign_in_at, :datetime
    # remove_column :users, :last_sign_in_at, :datetime
    # remove_column :users, :current_sign_in_ip, :inet
    # remove_column :users, :last_sign_in_ip, :inet

    ## Confirmable
    remove_column :users, :confirmation_token, :string
    remove_column :users, :confirmed_at, :datetime
    remove_column :users, :confirmation_sent_at, :datetime
    remove_column :users, :unconfirmed_email, :string

    ## Lockable
    # remove_column :users, :failed_attempts, :integer, default: 0, null: false
    # remove_column :users, :unlock_token, :string
    # remove_column :users, :locked_at, :datetime
  end
end
