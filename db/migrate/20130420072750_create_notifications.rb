class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :body

      t.timestamps
    end
  end
end
