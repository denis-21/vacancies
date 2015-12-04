class AddColumnCompanyIdToVacancy < ActiveRecord::Migration
  def change
    add_reference :vacancies,:company
  end
end
