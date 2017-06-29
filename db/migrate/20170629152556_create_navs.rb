class CreateNavs < ActiveRecord::Migration[5.0]
  def change
    create_table :navs do |t|

      t.integer :project_id
      t.string  :label
      t.string  :url
      t.integer :page_id
      t.integer :order, default: 0
      t.boolean :active, default: true
      t.boolean :open_new_page, default: false
      t.integer :page_type, default: 0

      t.timestamps
    end
  end
end
