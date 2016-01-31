class Attendance < ActiveRecord::Base
	

	belongs_to :session, :class_name => "Session" , :foreign_key => "session_id"
	belongs_to :user, :class_name => "User", :foreign_key => "user_id"

	


end
