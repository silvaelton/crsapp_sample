class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|

      t.string  :title
      t.string  :slug
      t.text    :mini_description
      t.integer :home_page_id
      t.date    :start 
      t.date    :end 

      t.date    :subscribe_start
      t.date    :subscribe_end
      t.boolean :allow_subscribe, default: false

      t.date    :consult_start
      t.date    :consult_end      
      t.boolean :allow_consult, default: false

      t.integer :situation, default: 0

      t.timestamps
    end
  end
end
