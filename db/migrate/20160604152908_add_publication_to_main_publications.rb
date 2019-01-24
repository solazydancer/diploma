class AddPublicationToMainPublications < ActiveRecord::Migration
  def change
    add_reference :main_publications, :publication, index: true, foreign_key: true
  end
end
