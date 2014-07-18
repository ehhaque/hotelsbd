json.array!(@paintings) do |painting|
  json.extract! painting, :id, :name, :image, :room_id, :hotel_id
  json.url painting_url(painting, format: :json)
end
