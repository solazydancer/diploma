task :parse_authors => :environment do
	SourcePerson.destroy_all
	SourcePerson.parse_data
	Rake::Task["parse_publications"].invoke
	Rake::Task["count"].invoke
	Rake::Task["save_results"].invoke
end