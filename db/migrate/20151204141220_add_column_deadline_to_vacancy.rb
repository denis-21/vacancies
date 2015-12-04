class AddColumnDeadlineToVacancy < ActiveRecord::Migration
  def change
    add_column :vacancies, :deadline, :date
  end
end
