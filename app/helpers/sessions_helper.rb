module SessionsHelper
  #log a given user
  def log_in_user(user)
    session[:user_id] = user.id
  end

  #remember a user in a session
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  #returns true if the given user is the current user
  def current_user?(user)
    user == current_user
  end


  #return the current login user
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: session[:user_id])
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in_user(user)
        @current_user = user
      end
    end

  end


  #return true if user is logged in
  def logged_user_in?
    !current_user.nil?
  end

  #forget a session
  def forget(user)
    user.forget #calling the model method
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  #log out the current user
  #this method is used in session controller, to delete users session
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end


  #redirects to stored location or default
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  #store the url the user wanted to visit
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
