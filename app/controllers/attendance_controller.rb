class AttendanceController < ApplicationController

  def new

    @attendance = Attendance.new
    @session = Session.next_session

    @check = Attendance.is_checked_in

    @attendance.is_coming = @is_coming


  end

  def create
    #calls next_session from Session model (if no next event exists, creates it)
    @session = Session.next_session
    
    #makes new Attendance object, sets user to current user
    @attendance = Attendance.new(:user => current_user)
    #sets session to next_session
    @attendance.session = @session

    #user_past checks if user has signed in yet
    @user_past = Attendance.where(:session => Session.next_session)

    #if user isnt signed in...
    if @user_past.nil?
      #call .save on attendance
      if @attendance.save
        flash[:notice] = "Posted!"
        redirect_to attendance_index_path
      else
        flash[:notice] = "Post failed!"
        logger.debug("There was an error!!!")
       end
     #if signed in, flash notice
    else
      flash[:notice] = "You've already signed in!"
      redirect_to attendance_index_path
    end
    

  end

  def index
    ##eliminates nil fields in attendance (do I need this? should move to model)
    @attendances = Attendance.where.not(user_id: nil, session_id: nil)
    @users = User.all
    @is_coming = @attendance.is_coming

  end

  def show
    @attendance = Attendance.find(params[:id])
    
  end

  private

  def attendance_params
    params.require(:attendance).permit(:user_id, :session_id, :email, :is_coming)
  end


end
