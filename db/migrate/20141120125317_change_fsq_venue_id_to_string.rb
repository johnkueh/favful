class ChangeFsqVenueIdToString < ActiveRecord::Migration
  def change
    change_column :items, :fsq_venue_id, :string
  end
end
