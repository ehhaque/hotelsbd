json.array!(@star_ratings) do |star_rating|
  json.extract! star_rating, :id, :rating
  json.url star_rating_url(star_rating, format: :json)
end
