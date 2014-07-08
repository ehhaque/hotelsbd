json.array!(@hotels) do |hotel|
  json.extract! hotel, :id, :name, :user_id, :desc, :star_rating, :address, :city
  json.url hotel_url(hotel, format: :json)
end
