task :parse_publications => :environment do
	Publication.get_publications
	Rake::Task["parse_publications_info"].invoke
	#Rake::Task["parse_publications_citations"].invoke
	#Rake::Task["parse_subs"].invoke
end
