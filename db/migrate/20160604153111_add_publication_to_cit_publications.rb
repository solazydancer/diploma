class AddPublicationToCitPublications < ActiveRecord::Migration
  def change
    add_reference :cit_publications, :publication, index: true, foreign_key: true
  end
end
