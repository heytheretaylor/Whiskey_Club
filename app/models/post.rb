class Post < ActiveRecord::Base
	
	belongs_to :user
	belongs_to :session
	belongs_to :whiskey

end
