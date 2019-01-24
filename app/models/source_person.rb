class SourcePerson < ActiveRecord::Base
	has_many :publications, dependent: :destroy

	def self.parse_data
		file = open("1.json")
		json_file = file.read
		parsed_file = JSON.parse(open("1.json").read)
		parsed_file.each do |parsed_tmp|
			person = SourcePerson.new
			person.last_name = parsed_tmp["last_name"]
			person.first_name = parsed_tmp["first_name"]
			person.second_name = parsed_tmp["second_name"]
			person.mephi_id = parsed_tmp["id"]
			check = SourcePerson.where(:mephi_id => person.mephi_id).first
			if check.nil?
				person.save
			else
				puts "Person already exists"
			end
		end

	end


	def self.get_count

		SourcePerson.all.each do |person|
			person.count = 0
			count = 0
			global_count = 0
			Publication.where(:source_person_id => person.id).each do |publication|
				if publication.index == '1'
					main = MainPublication.where(:publication_id => publication.id).first 
					if main.author_elib_id.present?
						person.elib_id = main.author_elib_id
					end
					count += 1
				end
				global_count += 1
			end
			person.global_count = global_count
			person.count = count
			person.save
		end
	end

end
