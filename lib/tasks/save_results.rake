task :save_results => :environment do
	file = File.open("post.json", "w") #{ |f| f.write SourcePerson.all.to_json }
	SourcePerson.all.each do |person|

		json = { "last_name": person.last_name, "count": person.count, "elib_id":person.elib_id }.to_json
		file.puts json

	end
	file.close
end