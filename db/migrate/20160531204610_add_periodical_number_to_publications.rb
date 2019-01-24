class AddPeriodicalNumberToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :periodical_number, :string
  end
end
