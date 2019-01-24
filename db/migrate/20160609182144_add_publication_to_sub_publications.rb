class AddPublicationToSubPublications < ActiveRecord::Migration
  def change
    add_reference :sub_publications, :publication, index: true, foreign_key: true
  end
end
