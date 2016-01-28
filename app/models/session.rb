class Session < ActiveRecord::Base
	# for user_turn. prob needs foreign key 
	# belongs_to :user

	has_many :attendances
	has_many :users, :through => :attendances

	#is that right?
	belongs_to :user_turn, :class_name => "User", :foreign_key => "user_id"

	has_many :posts

	belongs_to :whiskey
	
end
