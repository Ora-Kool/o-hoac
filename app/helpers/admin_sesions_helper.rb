module AdminSesionsHelper
	#log a given user
  def log_in_admin(admin)
    session[:admin_id] = admin.id
  end

   #remember a user in a session
  def remember(admin)
    admin.remember
    cookies.permanent.signed[:admin_id] = admin.id
    cookies.permanent[:remember_token] = admin.remember_token
  end

  #returns true if the given user is the current user
  def current_admin?(admin)
    admin == current_admin
  end

   #return the current login user
  def current_admin
    if (admin_id = session[:admin_id])
      @current_admin ||= Admin.find_by(id: session[:admin_id])
    elsif (admin_id = cookies.signed[:admin_id])
      admin = Admin.find_by(id: admin_id)
      if admin && admin.authenticated?(cookies[:remember_token])
        log_in_admin(admin)
        @current_admin = admin
      end
    end

  end


  #return true if user is logged in
  def logged_admin_in?
    !current_admin.nil?
  end

   #forget a session
  def forget(admin)
    admin.forget #calling the model method
    cookies.delete(:admin_id)
    cookies.delete(:remember_token)
  end


   #log out the current user
  #this method is used in session controller, to delete users session
  def sign_out
    forget(current_admin)
    session.delete(:admin_id)
    @current_admin = nil
  end

  
end
