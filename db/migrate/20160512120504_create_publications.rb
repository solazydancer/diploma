class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.integer :elib_id
      t.string :name
      t.string :main_author
      t.string :all_author
      t.string :periodical_name
      t.integer :number, default: 0

      t.timestamps null: false
    end
  end
end
