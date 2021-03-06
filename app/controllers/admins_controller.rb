class AdminsController < ApplicationController
  before_action :logged_in_admin, only: [:new, :create, :contacts, :dashboard,
   :users, :new_doctor, :create_doctor, :doctors, :destroy_message, :read,
  ]
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
    @departments = Department.all
    @department = Department.new
    @city = City.new

  end

  def users
  	@users = User.all
  end

  def doctors
  	@doctors = Doctor.all
  end

  def user_appointments
    @user = User.find(params[:user_id])
    @user_appointments = @user.appointments.all
  end

  def contacts
    @contacts = Contact.all
  end

  def new_doctor
    @doc = Doctor.new
  end

  def read
     @selected = Contact.find_by(id: params[:id])
     @selected.seen
  end

  def create_doctor
    @doc = Doctor.new(doctors_params)
    if @doc.save
      flash[:success] = "New doctor's account created!."
      redirect_to ohoac_administration_dashboard_path
    else
      render 'new_doctor'
    end
  end

  def create_department
    @department = Department.new(department_params)
    if @department.save
      flash[:success] = "Department added successfully!"
       redirect_to ohoac_administration_dashboard_path
      else
        flash[:error] = 'Department not added!'
        redirect_to ohoac_administration_dashboard_path
    end   
  end
  def remove_department
    @department = Department.find_by(params[:department_id])
    @department.destroy
    flash[:success] = "Department #{@department.id} has being removed!"
    redirect_to ohoac_administration_dashboard_path
  end

  def destroy_message
      @message = Contact.find_by(params[:contact_id])
      @message.destroy
      #flash[:success] = "Mail successfully removed!."
      respond_to do |format|
        format.html { redirect_to ohoac_administration_dashboard_messages_board_mails_all_path }
        format.js
      end

  end


  

  private 
  def admin_params
  	params.require(:admin).permit(:name,
                                  :email, 
                                  :password, 
                                  :password_confirmation)
  end

  def doctors_params
    params.require(:doctor).permit(:doctors_name,
                                   :city_id,
                                   :department_id,
                                   :gender_id,
                                   :password,
                                   :password_confirmation)
  end

  def department_params
    params.require(:department).permit(:department_name)
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
