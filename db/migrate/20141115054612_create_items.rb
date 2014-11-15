class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :user_id
      t.string :name
      t.text :summary
      t.boolean :is_public
      t.float :latitude
      t.float :longitude
      t.integer :fsq_venue_id
      t.string :fsq_venue_name

      t.timestamps
    end
  end
end
