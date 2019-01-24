json.array!(@sub_publications) do |sub_publication|
  json.extract! sub_publication, :id, :period_name, :edu_org, :number, :year, :pub_id, :pub_name, :pub_author, :pub_page, :pub_cited
  json.url sub_publication_url(sub_publication, format: :json)
end
