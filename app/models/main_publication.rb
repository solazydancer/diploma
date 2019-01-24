class MainPublication < ActiveRecord::Base
	belongs_to :publication

	def self.get_main_publication

		Publication.all.each do |pub_tmp|

				publication_id = pub_tmp.elib_id.to_s

				html = HTTParty.get('http://elibrary.ru/item.asp?id=' + publication_id)
				doc = Nokogiri::HTML(html)

				check = MainPublication.where(:elib_id => publication_id).first

				if check == nil

					main_pub_tmp = MainPublication.new

					main_pub_tmp.elib_id = publication_id
					main_pub_tmp.publication_id = pub_tmp.id

					name_tmp = doc.xpath("//tr/td/span/span[contains(@class, 'bigtext')]/b").first
					puts name_tmp
					if name_tmp
						main_pub_tmp.name = name_tmp.content
					else
						main_pub_tmp.name = name_tmp
					end

					# author = doc.xpath("//tr/td/span/a[contains(@href, 'author_items.asp?authorid=')]").first

					# if author
					# 	main_pub_tmp.main_author = author.content
					# 	author_href = author['href'].to_s
					# 	author_href.slice!(0, 26)
					# 	main_pub_tmp.author_elib_id = author_href
					# else
					# 	main_pub_tmp.main_author = author
					# end

					author = doc.xpath("//tr/td/span/a[contains(@href, 'author_items.asp?authorid=')]")
					s_person_tmp = SourcePerson.where(:id => pub_tmp.source_person_id).first
					str = s_person_tmp.last_name
					puts "ИЩЕМ"
					puts str
					str = str.mb_chars.upcase
					if author.present?
						count0 = 1
						flag0 = 0
						author.each do |a|
							if a.content.include?(str)
								puts a.content
								main_pub_tmp.main_author = a.content
								a_tmp = a['href'].to_s
								a_tmp.slice!(0,26)
								puts a_tmp
								main_pub_tmp.author_elib_id = a_tmp
								s_person_tmp.elib_id = a_tmp
								flag0 = count0
							end
							count0 += 1
						end
						sup = author.xpath("//span/font/sup")
						if sup.present?
							count1 = 1
							my_sup1 = ""
							sup.each do |s|
								if count1 == flag0
									my_sup1 = s.content
								end
								count1 += 1
							end

							sup2 = author.xpath("//td/font/sup")
							count2 = 1
							flag1 = 0
							sup2.each do |s|
								if s.content == my_sup1
									flag1 = count2
								end
								count2 += 1
							end
						end
					else
						string = s_person_tmp.last_name + ' ' + s_person_tmp.first_name + ' ' + s_person_tmp.second_name
						main_pub_tmp.main_author = string
					end

					org = doc.xpath("//tr/*/a[contains(@href, 'org_items.asp?orgsid=')]").first
					if org
						main_pub_tmp.edu_org = org.content
						if org.content.include?('Московский государственный инженерно-физический институт')
							pub_tmp.index = '1'
							puts "YES"
						end
						if org.content.include?('Московский инженерно-физический институт')
							main_pub_tmp.mephi_index = '1'
							pub_tmp.index = '1'
							puts "YES"
						end
						if org.content.include?('МИФИ')
							main_pub_tmp.mephi_index = '1'
							pub_tmp.index = '1'
							puts "YES"
						end
						if org.content.include?('MEPhI')
							main_pub_tmp.mephi_index = '1'
							pub_tmp.index = '1'
							puts "YES"
						end
						if org.content.include?('Moscow Engineering Physics Institute')
							main_pub_tmp.mephi_index = '1'
							pub_tmp.index = '1'
							puts "YES"
						end
					else
						org_tmp = doc.xpath("//a[contains(@href, 'org_about.asp?orgsid=')]").first
						if org_tmp
							main_pub_tmp.edu_org = org_tmp.content
							if org_tmp.content.include?('Московский государственный инженерно-физический институт')
								main_pub_tmp.mephi_index = '1'
								pub_tmp.index = '1'
								puts "YES"
							end
							if org_tmp.content.include?('Московский инженерно-физический институт')
								main_pub_tmp.mephi_index = '1'
								pub_tmp.index = '1'
								puts "YES"
							end
							if org_tmp.content.include?('MEPhI')
								main_pub_tmp.mephi_index = '1'
								pub_tmp.index = '1'
								puts "YES"
							end
							if org_tmp.content.include?('Moscow Engineering Physics Institute')
								main_pub_tmp.mephi_index = '1'
								pub_tmp.index = '1'
								puts "YES"
							end
							if org_tmp.content.include?('МИФИ')
								main_pub_tmp.mephi_index = '1'
								pub_tmp.index = '1'
								puts "YES"
							end
						end
					end

					period = doc.xpath("//tr/td/a[contains(@title, 'Оглавления выпусков этого журнала')]").first
					if period
						main_pub_tmp.period =  period.content
					end

					# ПРОБЛЕМЫ
					# year = doc.xpath("//td[contains(text(), 'Г')]")
					# puts year.inspect
					# year.each do |y|
					# 	puts y
					# end

					rinz_cit = doc.xpath("//td[contains(text(), 'Число цитирований в РИНЦ')]").first
					if rinz_cit
						rinz_tmp = rinz_cit.content.to_s
						rinz_tmp.slice!(0,29)
						main_pub_tmp.rinz_cited = rinz_tmp
					end

					nuc_rinz_cit = doc.xpath("//td[contains(text(), 'Число цитирований в ядре РИНЦ')]").first
					if nuc_rinz_cit
						nuc_rinz_tmp = nuc_rinz_cit.content.to_s
						nuc_rinz_tmp.slice!(0,34)
						main_pub_tmp.nuc_rinz_cited = nuc_rinz_tmp
					end

					sc_cit = doc.xpath("//tr/td/span[contains(@id, 'ScopusCited')]").first
					if sc_cit
						if sc_cit.content == ""
							main_pub_tmp.scopus_cited = "0"
						else  main_pub_tmp.scopus_cited = sc_cit.content
						end
					end

					wos_cit = doc.xpath("//tr/td/span[contains(@id, 'WosCited')]").first
					if wos_cit
						if wos_cit.content == ""
							main_pub_tmp.wos_cited = "0"
						else main_pub_tmp.wos_cited = wos.content
						end
					end

					impf = doc.xpath("//td[contains(text(), 'Импакт-фактор журнала в РИНЦ')]").first
					if impf
						i_tmp = impf.content.to_s
						i_tmp.slice!(0,32)
						main_pub_tmp.imp_f = i_tmp
					end

					norm_cit = doc.xpath("//td[contains(text(), 'Норм. цитируемость по журналу')]").first
					if norm_cit
						n_tmp = norm_cit.content.to_s
						n_tmp.slice!(0,33)
						main_pub_tmp.norm_cit = n_tmp
					end

					norm_cit_dir = doc.xpath("//tr/td/font/span[contains(@id, 'NormFieldCited')]").first
					if norm_cit_dir
						main_pub_tmp.norm_cit_dir = norm_cit_dir.content
					end

					main_pub_tmp.save
					pub_tmp.save
					s_person_tmp.save

				else puts "Info already exists"
				end

				sleep Random.new.rand(5..15)
		end
	end
end
