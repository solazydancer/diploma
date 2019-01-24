class AddPeriodIdToSubPublications < ActiveRecord::Migration
  def change
    add_column :sub_publications, :period_id, :string
  end
end
