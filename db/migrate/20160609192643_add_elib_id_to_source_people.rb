class AddElibIdToSourcePeople < ActiveRecord::Migration
  def change
    add_column :source_people, :elib_id, :string
  end
end
