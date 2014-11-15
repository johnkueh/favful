json.array!(@comments) do |comment|
  json.extract! comment, :id, :item_id, :user_id, :content, :updated_at, :created_at
end
