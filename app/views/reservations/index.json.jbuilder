json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :type, :start_date, :end_date, :room_id
  json.url reservation_url(reservation, format: :json)
end
