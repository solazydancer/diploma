task :parse_publications_citations => :environment do
	CitPublication.get_cit_publications
end