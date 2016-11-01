class DoctorSessionsController < ApplicationController
  def new
  end

  def create
    doctor = Doctor.find_by(doctors_name: params[:session][:doctors_name].downcase)
    if doctor && doctor.authenticate(params[:session][:password])
      flash[:success] = "Welcome back!"
      log_in_doctor(doctor)
      params[:session][:remember_me] == '1' ? remember(doctor) : forget(doctor)
      redirect_back_or(doctor)

    else
      flash.now[:danger] = 'Sorry! Invalid name/password combination'
      render 'new'
    end

  end

  def destroy
    sign_out_doctor if logged_doctor_in?
    redirect_to(root_path)
  end
end
