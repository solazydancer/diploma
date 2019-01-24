class CitPublication < ActiveRecord::Base
	belongs_to :publication

	def self.get_cit_publications

		Publication.all.each do |pub_tmp|

			src_id = pub_tmp.elib_id.to_s

			html = HTTParty.get('http://elibrary.ru/cit_items.asp?id=' + src_id)
			doc = Nokogiri::HTML(html)

				if pub_tmp.number != 0

					doc.xpath("//tr/td[contains(a/@href, 'item.asp?id=')]").drop(1).each do |el|

						id_tmp = el.xpath("a")
						id = id_tmp.to_s
						id.slice!(0,22)
						id = id.slice(0,8)

						check = CitPublication.where(:elib_id => id, :source_id => src_id).first					

						if check == nil

							publication_tmp = CitPublication.new

							publication_tmp.elib_id = id
							publication_tmp.publication_id = pub_tmp.id
							publication_tmp.main_author = pub_tmp.main_author

							name = el.xpath("a/b").first.content
							publication_tmp.name = name
							publication_tmp.source_id = src_id

							fonts = el.xpath("font")
							if fonts.present?
								authors = fonts[0].xpath("i").first
								if authors.present?
									publication_tmp.all_author = authors.content
								else 
									authors_1 = fonts[0]
									publication_tmp.all_author = authors
								end

								sources_a = fonts[1]
								if sources_a.present?
									sources = sources_a.xpath("a").first
									if sources.present?
										publication_tmp.periodical_name = sources.content
									else 
										authors_2 = fonts[1].content
										publication_tmp.periodical_name = authors_2
									end
									sources_n = sources_a.xpath("a").last
									if sources_n.present?
										if sources_n != sources
											publication_tmp.periodical_number = sources_n.content
										end
									end


								end

							end

							publication_tmp.save
						end

					end

				end
			sleep Random.new.rand(5..15)

		end

	end
end
