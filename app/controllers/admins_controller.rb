class AdminsController < ApplicationController
  before_action :logged_in_admin, only: [:new, :dashboard, :users, :doctors]
  #before_action :correct_admin, only: [:new, :dashboard, :users, :doctors]
  def new
  	@admin = Admin.new
  end

 def create
 	@admin = Admin.new(admin_params)
 	if @admin.save
 		log_in_admin(@admin)
 		flash[:success] = "Successfully login."
 		redirect_to ohoac_administration_dashboard_path
 	else
 		render 'new'
 	end
 end

  def dashboard
  	@users = User.all
  	@doctors = Doctor.all
    @contacts = Contact.all
  end

  def users
  	@users = User.all
  end

  def doctors
  	@doctors = Doctor.all
  end

  def appointments
    @user = User.find(params[:user_id])
    @appointments = @user.appointments.all
  end

  def contacts
    @contacts = Contact.all
  end

  def all_appointments
    @all_appointments = Appointment.all
  end


  private 
  def admin_params
  	params.require(:admin).permit(:name,
                                  :email, 
                                  :password, 
                                  :password_confirmation)
  end

  #comfirm if the current logged in user
  def logged_in_admin
    unless logged_admin_in?
      flash[:danger] = "Access denied."
      redirect_to root_path
    end
  end

  #confirming the correct user of the accessing page
  #def correct_admin
    #@admin = Admin.find_by(id: params[:id])
    #redirect_to(root_path) unless current_admin?(@admin)
  #end
end
