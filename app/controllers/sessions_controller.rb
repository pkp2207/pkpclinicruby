class SessionsController < ApplicationController
  def new
    # Render the login form
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      
      # Check role and redirect accordingly
      if @user.role.name == 'receptionist'
        redirect_to receptionist_dashboard_path
      elsif @user.role.name == 'doctor'
        redirect_to doctor_dashboard_path
      else
        redirect_to root_path, alert: 'Unauthorized access.'
      end
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out successfully.'
  end
end
