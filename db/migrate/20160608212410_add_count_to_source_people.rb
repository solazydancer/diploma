class AddCountToSourcePeople < ActiveRecord::Migration
  def change
    add_column :source_people, :count, :integer, default: 0
  end
end
