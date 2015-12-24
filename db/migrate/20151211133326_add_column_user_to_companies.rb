class AddColumnUserToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :creator_id, :integer
  end
end
