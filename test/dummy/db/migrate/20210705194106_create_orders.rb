class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :user, type: :bigint
      t.datetime :checked_out_at
      t.decimal :total_price, precision: 8, scale: 2, default: 0.0

      t.timestamps
    end
    add_index :orders, :checked_out_at
  end
end
