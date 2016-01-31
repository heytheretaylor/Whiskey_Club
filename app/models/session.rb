class Session < ActiveRecord::Base
	# for user_turn. prob needs foreign key 
	# belongs_to :user

	has_many :attendances
	has_many :users, :through => :attendances

	#is that right?
	belongs_to :user_turn, :class_name => "User", :foreign_key => "user_id"

	has_many :posts

	belongs_to :whiskey

	def self.date_of_next(day)
		date  = Date.parse(day)
		delta = date > Date.today ? 0 : 7
		date + delta
	end

	def self.next_session
		most_recent = Session.last

			if most_recent.date_of > Time.now
				return most_recent
			else
				Session.create(:date_of => self.date_of_next("Friday"))
			end

	end
	
end
