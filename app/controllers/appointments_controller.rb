class AppointmentsController < ApplicationController
  before_action :find_params, only: [:new, :create]
def index
  redirect_to "new"
end

  def new
    @appointment = Appointment.new
    @time = [:"1" => "07:00 AM",
             :"2" => "08:00 AM",
             :"3" => "09:00 AM",
             :"4" => "10:00 AM",
             :"5" => "11:00 AM",
             :"6" => "12:00 AM",
             :"7" => "01:00 PM",
             :"8" => "02:00 PM",
             :"9" => "03:00 PM",
             :"10" => "04:00 PM",
             :"11" => "05:00 PM"]

    @appointment_times = @time.map{|key, value| value}
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      flash[:success] = "You Appoinment as being submitted!"
      redirect_to current_user
    else
      render 'new'
    end
  end

  def destroy
    Appointment.find(params[:id]).destroy
    flash[:success] = "Appointment destroyed!"
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
end



