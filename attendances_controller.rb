class AttendanceController < ApplicationController

#might need this line, not sure how helpers work yet
helper DateHelper

def new
	@attend = Attendance.new

def create
	#makes new entry into attendance
	@attend = Attendance.new(attend_params)

	#sets user of attendance record to current user
	@attend.user = current_user

	##supposed to set session of attendance to the session with the date_of provided by the DateHelper, don't know if datehelper will work or what will happen if the entry doesn't exist yet. I might need to put this inside of the if statement so it creates the session if there isnt one and then sets the value

	@attend.session = Session.where(date_of: next_session)


	if @attend.session
		flash[:notice] = "registered for session on #{next_session}"
	else
		#not sure how this helper will work
		Session.new(next_session)
	end

	##i might also do it this way

	# opt_session = Session.where(date_of: next_session)

	#if opt_session
	# 	flash[:notice] = "registered for session on #{next_session}"
	# else
	# 	Session.new(next_session)
	# 	@attend.session = opt_session
	# end

