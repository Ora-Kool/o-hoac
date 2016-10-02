class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
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


  private

  def user_param
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
