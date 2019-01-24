task :parse_subs => :environment do
	SubPublication.get_subs
end