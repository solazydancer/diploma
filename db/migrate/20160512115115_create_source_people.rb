class CreateSourcePeople < ActiveRecord::Migration
  def change
    create_table :source_people do |t|
      t.string :last_name
      t.string :first_name
      t.string :second_name
      t.integer :mephi_id

      t.timestamps null: false
    end
  end
end
