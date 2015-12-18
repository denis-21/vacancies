class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name, default: ""
      t.string :last_name, default: ""
      t.date :bith_date
      t.references :user, foreign_key: true
      t.timestamps null: false
    end
  end
end
