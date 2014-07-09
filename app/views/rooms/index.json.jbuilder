json.array!(@rooms) do |room|
  json.extract! room, :id, :room_type, :hotel_id, :bed_type, :num_beds, :price, :currency
  json.url room_url(room, format: :json)
end
