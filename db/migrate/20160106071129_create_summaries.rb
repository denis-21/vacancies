class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.string :email, null: false, default: ''
      t.string :first_name, default: ''
      t.string :last_name, default: ''
      t.string :status
      t.references :vacancy
      t.timestamps null: false
    end
  end
end
