class AddColumnUserToVacacies < ActiveRecord::Migration
  def change
    add_column :vacancies, :creator_id,:integer
  end
end
