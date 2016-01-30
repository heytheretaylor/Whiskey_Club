class Attendance < ActiveRecord::Base
	belongs_to :session, :class_name => "Session" , :foreign_key => "session_id"
	belongs_to :user, :class_name => "User", :foreign_key => "user_id"

	def self.is_checked_in
		a = Attendance.where(:session => Session.next_session)

		if a.nil?
			return false
		else
			return true

		end
	end
end
