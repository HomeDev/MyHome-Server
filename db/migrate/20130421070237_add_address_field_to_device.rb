class AddAddressFieldToDevice < ActiveRecord::Migration
  def change
    add_column :devices, :address_id, :integer
    add_index :devices, :address_id

    create_table :addresses do |t|
      t.string :address

      t.timestamps
    end
  end
end
