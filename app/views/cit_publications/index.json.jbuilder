json.array!(@cit_publications) do |cit_publication|
  json.extract! cit_publication, :id, :elib_id, :name, :source_id, :main_author, :all_author, :periodical_name, :periodical_number
  json.url cit_publication_url(cit_publication, format: :json)
end
