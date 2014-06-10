json.array!(@animals) do |animal|
  json.extract! animal, :id, :name, :sex, :birthdate, :organisation_id, :description
  json.url animal_url(animal, format: :json)
end
