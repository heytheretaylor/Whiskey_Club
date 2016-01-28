class CreateWhiskeys < ActiveRecord::Migration
  def change
    create_table :whiskeys do |t|

      t.timestamps null: false
      t.string :name
    end
  end
end
