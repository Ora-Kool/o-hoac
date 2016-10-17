class UsersController < ApplicationController
  before_action :logged_in, only: [:edit, :update, :show]
  before_action :correct_user, only: [:edit, :update, :show]

  def show
    if params[:department].blank?
      @user = User.find(params[:id])
      @doctors = Doctor.paginate(page: params[:page], per_page: 2)
      @appointments = @user.appointments.all
    else
      @user = User.find(params[:id])
      @department_id = Department.find_by(department_name: params[:department]).id
      @doctors = Doctor.paginate(page: params[:page], per_page: 2).where(department_id: @department_id)
      @appointments = @user.appointments.all
    end

  end
  #instantiate a new user
  def new
    @user = User.new
    @genders = Gender.all.map{ |gender| [gender.name, gender.id] }
    @cities = City.all.map{ |city| [city.city_name, city.id]}
  end

  def create
    @user = User.new(user_param)
    if @user.save
      #login this user when credentials are valid
      log_in_user(@user)
      flash[:success] = "Welcome to the O-H-O"
      #redirect_to(edit_user_path(@user))
      redirect_to(@user)
      else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_update)
      flash[:success] = "Profile updated successful!"
      redirect_to @user
    else
      render 'edit'
    end
  end



  private

  def user_param
    params.require(:user).permit(:name,
                                 :gender_id,
                                 :city_id,
                                 :mobile_phone,
                                 :email,
                                 :password,
                                 :password_confirmation)
  end

  #to be updated later
  def user_update
    params.require(:user).permit(:profile_photo,
                                 :name,
                                 :first_name,
                                 :last_name,
                                 :gender_id,
                                 :mobile_phone,
                                 :city_id,
                                 :dob,
                                 :password,
                                 :password_confirmation)
  end

  #comfirm if the current logged in user
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
    redirect_to(login_path) unless current_user?(@user)
  end
end
