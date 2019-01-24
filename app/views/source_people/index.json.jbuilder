json.array!(@source_people) do |source_person|
  json.extract! source_person, :id, :last_name, :first_name, :second_name, :mephi_id
  json.url source_person_url(source_person, format: :json)
end
