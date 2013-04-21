class AddDeviceIdToAddresses < ActiveRecord::Migration
  def change
    remove_index :devices, :address_id
    remove_column :devices, :address_id

    add_column :addresses, :device_id, :integer
    add_index :addresses, :device_id
  end
end
