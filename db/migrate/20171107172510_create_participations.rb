class CreateParticipations < ActiveRecord::Migration[5.0]
  def change
    create_table :participations do |t|
      t.integer   :candidate_id
      t.boolean   :closed, default: false
      t.datetime  :closed_date 
      t.timestamps
    end
  end
end
