class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.string :title
      t.text :description
      t.string :city
      t.string :country
      t.timestamps null: false
    end
  end
end
