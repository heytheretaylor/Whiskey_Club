class AttendanceController < ApplicationController
  def check_in
  	@attendance_new = Attendance.new
  	@attendance_new.user_id = current_user
  	@attendances = Attendance.all
  	@users = User.all
  	@sessions = Session.all
  end

  def new
  	@attendance = Attendance.new
  	
  end
end
