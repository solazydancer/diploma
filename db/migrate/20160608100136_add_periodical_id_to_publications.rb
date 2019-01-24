class AddPeriodicalIdToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :periodical_id, :string
  end
end
