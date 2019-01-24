class CreateSubPublications < ActiveRecord::Migration
  def change
    create_table :sub_publications do |t|
      t.string :period_name
      t.string :edu_org
      t.string :number
      t.string :year
      t.string :pub_id
      t.string :pub_name
      t.string :pub_author
      t.string :pub_page
      t.string :pub_cited

      t.timestamps null: false
    end
  end
end
