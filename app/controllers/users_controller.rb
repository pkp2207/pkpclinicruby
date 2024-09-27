class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      if @user.role == "doctor"
        redirect_to doctors_dashboard_path, notice: "Welcome, Doctor!"
      else
        redirect_to receptionists_dashboard_path, notice: "Welcome, Receptionist!"
      end
    else
      flash.now[:alert] = "There was an error creating your account."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :role)
  end
end
