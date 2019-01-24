task :parse_publications_info => :environment do
	MainPublication.get_main_publication
end