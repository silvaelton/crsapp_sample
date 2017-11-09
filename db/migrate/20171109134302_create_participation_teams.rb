class CreateParticipationTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :participation_teams do |t|
      t.integer :participation_id
      t.string  :name
      t.string  :job
      t.timestamps
    end
  end
end
