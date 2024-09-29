class UsersController < ApplicationController
  def new
    @user = User.new
    @roles = Role.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      if @user.role.name == "doctor"
        redirect_to doctors_dashboard_path, notice: "Welcome, Doctor!"
      else
        redirect_to receptionist_dashboard_path, notice: "Welcome, Receptionist!"
      end
    else
      @roles = Role.all
      flash.now[:alert] = "There was an error creating your account. Errors: #{@user.errors.full_messages.join(', ')}"
      render :new
    end
  end
  

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :role_id) # Permit role_id instead of role
  end
end
