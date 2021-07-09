class AddPositionToUserAddresses < ActiveRecord::Migration[6.1]
  def change
    add_column :user_addresses, :position, :integer
  end
end
