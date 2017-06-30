class CreateCandidates < ActiveRecord::Migration[5.0]
  def change
    create_table :candidates do |t|

      t.integer :project_id
      t.string  :name
      t.string  :rg
      t.integer :gender
      t.date    :born
      t.string  :cpf
      t.string  :uf
      t.string  :address
      t.string  :burgh
      t.string  :city
      t.string  :cep
      t.string  :telephone
      t.string  :celphone
      t.string  :email
      t.string  :fantasy_name
      t.string  :social_reason
      t.string  :cnpj
      t.string  :password
      t.boolean :terms_use
      t.text    :observation
      
      t.string  :document_one
      t.string  :document_two

      t.integer :status, default: 0

      t.timestamps
    end
  end
end
