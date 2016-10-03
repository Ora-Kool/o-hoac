class UsersController < ApplicationController
  before_action :logged_in, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]
  def show
    @user = User.find(params[:id])
    @users = User.all
  end
  #instantiate a new user
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_param)
    if @user.save
      #login this user when credentials are valid
      log_in_user(@user)
      flash[:success] = "Welcome to the O-H-O"
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
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  #to be updated later
  def user_update
    params.require(:user).permit(:name, :first_name, :last_name, :mobile_phone)
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
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
end
