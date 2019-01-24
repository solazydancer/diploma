json.array!(@publications) do |publication|
  json.extract! publication, :id, :elib_id, :name, :main_author, :all_authors, :periodical_name
  json.url publication_url(publication, format: :json)
end
