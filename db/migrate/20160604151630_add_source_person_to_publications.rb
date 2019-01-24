class AddSourcePersonToPublications < ActiveRecord::Migration
  def change
    add_reference :publications, :source_person, index: true, foreign_key: true
  end
end
