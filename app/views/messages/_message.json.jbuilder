json.extract! message, :id, :from_id, :to_id, :meal_id, :content, :read_at, :created_at, :updated_at
json.url message_url(message, format: :json)
