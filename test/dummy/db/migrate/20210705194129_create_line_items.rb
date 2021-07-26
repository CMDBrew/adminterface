class CreateLineItems < ActiveRecord::Migration[6.1]
  def change
    create_table :line_items do |t|
      t.references :order, type: :bigint
      t.references :product, type: :bigint
      t.decimal :price

      t.timestamps
    end
  end
end
