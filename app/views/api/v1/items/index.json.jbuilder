json.array!(@items) do |item|
  json.extract! item, :id, :user, :name, :summary, :is_public, :latitude, :longitude, :fsq_venue_id, :fsq_venue_name, :updated_at, :created_at
end
