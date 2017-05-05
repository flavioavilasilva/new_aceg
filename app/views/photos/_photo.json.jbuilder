json.extract! photo, :id, :pet_id, :created_at, :updated_at
json.url photo_url(photo, format: :json)