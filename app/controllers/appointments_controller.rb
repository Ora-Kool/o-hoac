class AppointmentsController < ApplicationController
  before_action :find_params, only: [:new, :create]
  before_action :logged_in, only: [:new, :create, :destroy, :show, :edit, :update]
  before_action :correct_user, only: [:new, :create, :destroy, :show, :edit, :update]

def index
  redirect_to 'new'
end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      flash[:success] = 'Your appointment as being submitted!'
      redirect_to current_user
    else
      render 'new'
    end
  end

  def destroy
    Appointment.find(params[:id]).destroy
    flash[:success] = 'Appointment destroyed!'
    redirect_to request.referrer || current_user
  end



  private

  def appointment_params
    params.require(:appointment).permit(:reason,
                                        :apt_date,
                                        :doctor_id,
                                        :user_id,
                                        :appt_time,
                                        :appointment_token)
  end

  def find_params
    @user = User.find(params[:user_id] || params[:id])
    @doctor = Doctor.find(params[:doctor_id] || params[:id])
  end

  def logged_in
    unless logged_user_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_path
    end
  end

  #confirming the correct user of the accessing page
  def correct_user
    @user = User.find_by(id: params[:id])
    flash[:danger] = "Please log in."
    redirect_to(login_path) unless current_user?(@user)
  end
end



