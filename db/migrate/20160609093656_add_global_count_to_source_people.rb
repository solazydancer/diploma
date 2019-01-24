class AddGlobalCountToSourcePeople < ActiveRecord::Migration
  def change
    add_column :source_people, :global_count, :integer, default: 0
  end
end
