class ReceptionistsController < ApplicationController
  before_action :require_user
  before_action :require_receptionist

  def dashboard
    if params[:query].present?
      @patients = Patient.where("first_name ILIKE ? OR last_name ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    else
      @patients = Patient.all
    end
  end
  

  private

  def require_receptionist
    redirect_to root_path unless current_user.role == 'receptionist'
  end
end
