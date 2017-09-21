class CreateQuestionOnes < ActiveRecord::Migration[5.0]
  def change
    create_table :question_ones do |t|
      t.integer :candidate_id
      t.integer :answer
      t.integer :project_id

      t.timestamps
    end
  end
end
