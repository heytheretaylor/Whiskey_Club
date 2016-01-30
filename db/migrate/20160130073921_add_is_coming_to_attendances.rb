class AddIsComingToAttendances < ActiveRecord::Migration
  def change
    add_column :attendances, :is_coming, :boolean
  end
end
