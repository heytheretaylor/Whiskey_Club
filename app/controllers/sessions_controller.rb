class SessionsController < ApplicationController
	def new
		@session = Session.new
	end

	def create
		@session = Session.new(session_params)

		# Creates new attendance record
		# @attendance = Attendance.new
		# @attendance.session = @session
		# @attendance.user = current_user
		# @attendance.save




		if @session.save
			flash[:notice] = "Session Created!"
			redirect_to sessions_path
		else
			logger.debug("there was an error!")
			
			
		end
	end

	def show
		@session = Session.find(params[:id])
	end


	def index
		@sessions = Session.all
		@attendance = Attendance.all
		@user = User.all
	end

	private

	def session_params
		params.require(:session).permit(:whiskey_id, :user_id, :date_of)
	end


end
