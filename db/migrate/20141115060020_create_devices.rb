class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.integer :user_id
      t.string :access_token
      t.string :vendor_identifier

      t.timestamps
    end
  end
end
