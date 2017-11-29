class CreateWinners < ActiveRecord::Migration[5.0]
  def change
    create_table :winners do |t|
      t.integer :participation_id
      t.integer :winner_type
      t.integer :project_id

      t.timestamps
    end
  end
end
