class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|

      t.timestamps null: false
      t.datetime :date_of
      t.integer :whiskey_id
      t.integer :user_turn
      
    end
  end
end
