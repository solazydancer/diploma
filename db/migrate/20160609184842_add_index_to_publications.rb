class AddIndexToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :index, :string
  end
end
