class AddBiographyToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :biography, :text
  end
end
