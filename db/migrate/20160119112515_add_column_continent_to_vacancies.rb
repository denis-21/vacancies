class AddColumnContinentToVacancies < ActiveRecord::Migration
  def change
    add_column :vacancies, :continent, :string
  end
end
