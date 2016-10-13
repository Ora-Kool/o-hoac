class DoctorsController < ApplicationController
  before_action :logged_in_doctor, only: [:index, :edit, :update, :show, :refresh_appointments]
  before_action :owner, only:     [:index, :edit, :update, :show, :refresh_appointments]
  before_action :find_params
  def index
  end

  def new
  end

  def show
    @doctor = Doctor.find_by(id: params[:id])
      @users = User.all
      @appointments = @doctor.appointments.all
      @apps = @doctor.appointments.all
     @appointments_by_date = @apps.group_by(&:apt_date)
    @date = params[:date] ? Date.parse(params[:date])  : Date.today

    respond_to do |format|
      format.js { render "doctors/show.js.erb"}
      format.html
    end
  end

  def refresh_appointments
    @appointments = @doctor.appointments.paginate(page: params[:page], per_page: 2)
    respond_to do |format|
      format.js { render :partial => 'doctors/shared/appointment'}
    end
  end


  #this create method needs to be updated cos as default admin can add doctors
  def create

  end

  def edit
    @doctor = Doctor.find(params[:id])
  end



  def update
    @doctor = Doctor.find(params[:id])
    if @doctor.update(update_infos)
      flash[:success] = "Profile updated!"
      redirect_to @doctor
    else
      render 'edit'
    end
  end

  private

  #not yet active cos i dont want doctors to create account by default, admin should create doctors accounts
  def doctor_params
    params.require(:doctor).permit(:doctors_name, :password, :password_confirmation)
  end

  def update_infos
    params.require(:doctor).permit(:doctors_name,
                                   :speciality,
                                   :professional_details,
                                   :password,
                                   :password_confirmation)
  end

  #comfirm if the current logged in user
  def logged_in_doctor
    unless logged_doctor_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to signin_path
    end
  end

  #confirming the correct user of the accessing page
  def owner
    @doctor = Doctor.find_by(id: params[:id])
    if current_doctor?(@doctor)

    else
      #redirect_to(signin_path)
    end
     #unless current_doctor?(@doctor)
  end

  def find_params
    @doctor = Doctor.find_by(id: params[:id])
  end



end
