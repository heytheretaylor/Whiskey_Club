class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|

      t.timestamps null: false
      t.integer :user_id
      t.integer :session_id
    end
  end
end
