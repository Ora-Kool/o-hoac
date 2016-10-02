module SessionsHelper
  #log a given user
  def log_in_user(user)
    session[:user_id] = user.id
  end

  #return the current login user
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  #return true if user is logged in
  def logged_in_user?
    !current_user.nil?
  end

  #log out the current user
  #this method is used in session controller, to delete users session
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
