class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|

      t.integer :project_id 
      t.string  :name 
      t.text    :content
      t.boolean :active, default: true
      
      t.timestamps
    end
  end
end
