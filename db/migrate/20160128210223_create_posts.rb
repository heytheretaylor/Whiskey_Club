class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|

      t.references :user, index: true, foreign_key: true
      t.references :whiskey, index: true, foreign_key: true
      t.references :session, index: true, foreign_key: true
      t.string :content
      
    end
  end
end
