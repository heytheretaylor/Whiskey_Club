class Whiskey < ActiveRecord::Base
	has_many :sessions
	has_many :posts
	
end
