class CreateConsults < ActiveRecord::Migration[5.0]
  def change
    create_table :consults do |t|

      t.integer :project_id 
      t.text    :content   
      t.integer :situation, default: 0
      t.integer :user_id

      t.timestamps
    end
  end
end
