module DoctorSessionsHelper
  #log a given user
  def log_in_doctor(doctor)
    session[:doctor_id] = doctor.id
  end

  #remember a user in a session
  def remember(doctor)
    doctor.remember
    cookies.permanent.signed[:doctor_id] = doctor.id
    cookies.permanent[:remember_token] = doctor.remember_token
  end

  #returns true if the given user is the current user
  def current_doctor?(doctor)
    doctor == current_doctor
  end


  #return the current login user
  def current_doctor
    if (doctor_id = session[:doctor_id])
      @current_doctor ||= Doctor.find_by(id: session[:doctor_id])
    elsif (doctor_id = cookies.signed[:doctor_id])
      doctor = Doctor.find_by(id: doctor_id)
      if doctor && doctor.authenticated?(cookies[:remember_token])
        log_in_doctor(doctor)
        @current_doctor = doctor
      end
    end

  end


  #return true if user is logged in
  def logged_doctor_in?
    !current_doctor.nil?
  end

  #forget a session
  def forget(doctor)
    doctor.forget #calling the model method
    cookies.delete(:doctor_id)
    cookies.delete(:remember_token)
  end

  #log out the current user
  #this method is used in session controller, to delete users session
  def sign_out_doctor
    forget(current_doctor)
    session.delete(:doctor_id)
    @current_doctor = nil
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
