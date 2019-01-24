json.array!(@main_publications) do |main_publication|
  json.extract! main_publication, :id, :elib_id, :name, :main_author, :author_elib_id, :edu_org, :period, :year, :rinz_cited, :nuc_rinz_cited, :scopus_cited, :wos_cited, :imp_f, :norm_cit, :norm_cit_dir
  json.url main_publication_url(main_publication, format: :json)
end
