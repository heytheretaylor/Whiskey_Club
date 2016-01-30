class Session < ActiveRecord::Base
	# for user_turn. prob needs foreign key 
	# belongs_to :user

	has_many :attendances
	has_many :users, :through => :attendances

	#is that right?
	belongs_to :user_turn, :class_name => "User", :foreign_key => "user_id"

	has_many :posts

	belongs_to :whiskey

	# def next_friday_calc(day)
		
	# end

	def self.next_session
		most_recent = Session.last
		# if most_recent.date_of.nil?
			# current_date = Time.now

			if most_recent.date_of > Time.now
				return most_recent
			else
				Session.create(:date_of => most_recent.date_of+7.days)
			end
		# end

	end
	
end
