class CreateCitPublications < ActiveRecord::Migration
  def change
    create_table :cit_publications do |t|
      t.string :elib_id
      t.string :name
      t.string :source_id
      t.string :main_author
      t.string :all_author
      t.string :periodical_name
      t.string :periodical_number

      t.timestamps null: false
    end
  end
end
