class AttendanceController < ApplicationController



  def current_attend
    a = Attendance.where(:session => Session.next_session)
    b = a.where(:user => current_user)
    c = b.last

    if c.nil?
      return false
    else
      return c
    end

  end


  
  def new

    @attendance = Attendance.new
    @session = Session.next_session


    @current_attend = current_attend



  end

  def create
    #calls next_session from Session model (if no next event exists, creates it)
    @session = Session.next_session
    
    #makes new Attendance object, sets user to current user

    ## removed :user => current_user from params for new, might let me take bool?
    @attendance = Attendance.new(attendance_params)
    #sets session to next_session
    @attendance.session = @session
    @attendance.user = current_user



    if @attendance.save
      flash[:notice] = "Posted!"
      redirect_to attendance_index_path
    else
      flash[:notice] = "Post failed!"
      logger.debug("There was an error!!!")
     end
    
    

  end

  def index
    ##eliminates nil fields in attendance (do I need this? should move to model)
    @attendances = Attendance.where.not(user_id: nil, session_id: nil)
    @users = User.all

    @current_attend = current_attend

  end

  def show
    @attendance = Attendance.find(params[:id])
    
  end

  private

  def attendance_params
    params.require(:attendance).permit(:user_id, :session_id, :is_coming)
  end


end
