class CreateParticipationDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :participation_documents do |t|
      t.integer :participation_id
      t.integer :participation_type_id
      t.string  :document
      t.timestamps
    end
  end
end
