class SubPublication < ActiveRecord::Base
	belongs_to :publication

	def self.get_subs

		Publication.all.each do |pub_tmp|	

			some_id = pub_tmp.periodical_id.to_s	

			html = HTTParty.get('http://elibrary.ru/contents.asp?issueid=' + some_id)
			doc = Nokogiri::HTML(html)

			title = doc.xpath("//tr/td/div[contains(a/@href, 'title_about.asp?id=')]")
			magazine_name = title.xpath("a/font/b").first
			if magazine_name.present?
				mag_name = magazine_name.content
			else mag_name = ""
			end

			org = title.xpath("a").last
			if org.present?
				org1 = org.content
			else org1 = ""
			end
			puts org


			num_year = doc.xpath("//tr/td/div/font/b")
			if num_year.present?
				number = num_year.first.content
				year = num_year.last.content
			else 
				number = ""
				year = ""
			end

			doc.xpath("//tr/td[contains(a/@href, 'item.asp?id=')]").each do |el|


				id = el.xpath("a").first
				id = id['href'].to_s
				id.slice!(0,12)

				check = SubPublication.where(:pub_id => id).first

				if check == nil

					sub_tmp = SubPublication.new

					sub_tmp.pub_id = id
					sub_tmp.period_id = some_id
					name = el.xpath("a/b").first.content
					sub_tmp.pub_name = name

					authors = el.xpath("font/i").first.content
					sub_tmp.pub_author = authors

					sub_tmp.period_name = mag_name
					sub_tmp.edu_org = org1
					sub_tmp.number = number
					sub_tmp.year = year

					sub_tmp.save
				end

			end
			sleep Random.new.rand(5..15)
		end

		# doc.xpath("//tr/td[contains(a/@href, 'cit_items.asp?id=')]").each do |el|

		# 	id = el.xpath("a").first
		# 	my_file.puts id.content
		# 	id = id['href'].to_s
		# 	id.slice!(0,17)
		# 	my_file.puts id
		 
		# end

	end

end
