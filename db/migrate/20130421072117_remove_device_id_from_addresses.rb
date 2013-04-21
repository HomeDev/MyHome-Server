class RemoveDeviceIdFromAddresses < ActiveRecord::Migration
  def change
    remove_index :addresses, :device_id
    remove_column :addresses, :device_id

    add_column :devices, :address_id, :integer
    add_index :devices, :address_id
  end
end
