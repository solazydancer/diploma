class CreateMainPublications < ActiveRecord::Migration
  def change
    create_table :main_publications do |t|
      t.string :elib_id
      t.string :name
      t.string :main_author
      t.string :author_elib_id
      t.string :edu_org
      t.string :period
      t.string :year
      t.string :rinz_cited
      t.string :nuc_rinz_cited
      t.string :scopus_cited
      t.string :wos_cited
      t.string :imp_f
      t.string :norm_cit
      t.string :norm_cit_dir

      t.timestamps null: false
    end
  end
end
