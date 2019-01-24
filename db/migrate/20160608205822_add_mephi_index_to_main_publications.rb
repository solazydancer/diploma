class AddMephiIndexToMainPublications < ActiveRecord::Migration
  def change
    add_column :main_publications, :mephi_index, :string
  end
end
