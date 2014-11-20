json.array!(@comments) do |comment|
  json.extract! comment, :id, :item_id, :user, :content, :updated_at, :created_at
end
