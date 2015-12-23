class CreateExternalClients < ActiveRecord::Migration
  def change
    create_table :external_clients do |t|
      t.string :name, null: false
      t.string :description
      t.text :secret_key
      t.timestamps null: false
    end
  end
end
