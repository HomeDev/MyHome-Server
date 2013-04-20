class AddSubscriptionFieldToDevice < ActiveRecord::Migration
  def change
    add_column :devices, :subscribe, :boolean, default: false
    add_index :devices, :subscribe
  end
end
