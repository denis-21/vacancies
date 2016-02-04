class AddColumnForAdressToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :continent, :string
    add_column :companies, :country, :string
    add_column :companies, :city, :string
  end
end
