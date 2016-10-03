class AppointmentsController < ApplicationController

  def new
    @appointment = Appointment.new
  end

  def create

  end


  private

  def find_params
    @user = User.find(:user_id)
  end
end
