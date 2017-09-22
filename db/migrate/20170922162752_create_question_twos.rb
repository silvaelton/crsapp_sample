class CreateQuestionTwos < ActiveRecord::Migration[5.0]
  def change
    create_table :question_twos do |t|
      t.integer :candidate_id
      t.string :cpf
      t.string :name
      t.boolean :term_use
      t.integer :project_id

      t.timestamps
    end
  end
end
