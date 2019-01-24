class Publication < ActiveRecord::Base
	belongs_to :source_person
	has_one :main_publication, dependent: :destroy
	has_many :cit_publications, dependent: :destroy
	has_many :sub_publications, dependent: :destroy

	def self.get_publications

		SourcePerson.all.each do |person|

			author_tmp = person.last_name + ' ' + person.first_name[0] + ' ' + person.second_name[0] + '|'

			html = HTTParty.post('http://elibrary.ru/query_results.asp', query: {ftext: "", 
			where_name: "on", where_abstract: "on", where_keywords: "on", 
			type_article: "on", type_disser: "on", type_book: "on", type_report: "on", type_conf: "on", 
			type_patent: "on", type_preprint: "on", 
			rubrics_all: "", authors_all: URI.escape(author_tmp), titles_all: "",
			search_morph: "on",
			begin_year: "0", end_year: "0", issues: "all", 
			orderby: "rank", order: "rev", changed: "1", 
			querybox_name: "", queryboxid: "0", queryid: "", save_queryboxid: "0", search_itemboxid: ""})

			doc = Nokogiri::HTML(html)

			author_tmp_1 = person.last_name + ' ' + person.first_name + ' ' + person.second_name

			doc.xpath("//tr/td[contains(a/@href, 'item.asp?id=')]").each do |el|

				# id works
				id_tmp = el.xpath("a")
				id = id_tmp.to_s
				id.slice!(0,22)
				id = id.slice(0,8)

				check = Publication.where(:elib_id => id).first

				if check == nil

					publication_tmp = Publication.new

					publication_tmp.source_person_id = person.id

					publication_tmp.elib_id = id
					publication_tmp.main_author = author_tmp_1

					name = el.xpath("a/b").first.content
					publication_tmp.name = name

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
								sources_id = sources['href'].to_s
								sources_id.slice!(0,22)
								publication_tmp.periodical_id = sources_id
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

						if publication_tmp.periodical_name

							if publication_tmp.periodical_name.include?('Московский государственный инженерно-физический институт')
								publication_tmp.index = '1'
							end
							if publication_tmp.periodical_name.include?('Московский инженерно-физический институт')
								publication_tmp.index = '1'
							end
							if publication_tmp.periodical_name.include?('МИФИ')
								publication_tmp.index = '1'
							end
							if publication_tmp.periodical_name.include?('MEPhI')
								publication_tmp.index = '1'
							end
							if publication_tmp.periodical_name.include?('Moscow Engineering Physics Institute')
								publication_tmp.index = '1'
							end
						end

					end
				publication_tmp.save

				end

			end


			cits = doc.xpath("//tr/td/a[contains(@href, 'cit_items.asp?id=')]")
			cits.each do |cit_tmp|
				cit = cit_tmp.content
				id_source = cit_tmp['href'].to_s
				id_source.slice!(0,17)
				publication_tmp = Publication.where(:elib_id => id_source).first
				publication_tmp.number = cit
				publication_tmp.save
			end

			sleep Random.new.rand(5..15)
		end
	end

end
