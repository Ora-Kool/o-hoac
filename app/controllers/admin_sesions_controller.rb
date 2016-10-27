class AdminSesionsController < ApplicationController
  def new

  end

  def create
  	admin = Admin.find_by(email: params[:session][:email].downcase)
    if admin && admin.authenticate(params[:session][:password])
      flash[:success] = "Welcome back!"
      log_in_admin(admin)
      params[:session][:remember_me] == '1' ? remember(admin) : forget(admin)
      redirect_to ohoac_administration_dashboard_path

    else
      flash.now[:danger] = 'Sorry! Invalid name/password combination'
      render 'new'
    end

  end
  def destroy
    sign_out if logged_admin_in?
    redirect_to(root_path)
  end
end
