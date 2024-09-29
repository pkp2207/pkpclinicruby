class ReceptionistsController < ApplicationController
  before_action :require_user
  before_action :require_receptionist

  def dashboard
    @patient = Patient.new  # Initialize @patient here
    if params[:query].present?
      @patients = Patient.where("first_name ILIKE ? OR last_name ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    else
      @patients = Patient.all
    end
  end

  def new_patient
    @patient = Patient.new
  end

  def create_patient
    @patient = Patient.new(patient_params)
    @patient.role_id = 16  # Assign role_id of 16 to new patients

    if @patient.save
      redirect_to receptionist_dashboard_path, notice: "Patient registered successfully."
    else
      render :new_patient
    end
  end

  private

  def require_receptionist
    role_name = current_user.role&.name # Get the role name
    Rails.logger.debug "User role: #{role_name}" # Log the role for debugging

    unless role_name == 'receptionist' # Check if the role is receptionist
      redirect_to root_path, alert: "Access denied."
    end
  end

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :dob, :address)
  end
end
