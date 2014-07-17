json.array!(@bed_types) do |bed_type|
  json.extract! bed_type, :id, :name
  json.url bed_type_url(bed_type, format: :json)
end
