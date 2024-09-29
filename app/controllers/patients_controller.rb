class PatientsController < ApplicationController
  before_action :require_user
  before_action :require_receptionist
  before_action :set_patient, only: [:edit, :update, :destroy]

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params.merge(role_id: 16))  # Assign role_id of 16
    if @patient.save
      redirect_to receptionist_dashboard_path, notice: "Patient registered successfully."
    else
      render :new
    end
  end

  def edit
    # @patient is already set by the before_action
  end

  def update
    if @patient.update(patient_params)
      redirect_to receptionist_dashboard_path, notice: "Patient updated successfully."
    else
      render :edit
    end
  end

  def destroy
    Rails.logger.debug "Attempting to delete patient with ID: #{params[:id]}"
    @patient = Patient.find(params[:id])
    @patient.destroy
    redirect_to receptionist_dashboard_path, notice: "Patient deleted successfully."
  end
  

  # Fetch all patients for the dashboard
  def dashboard
    @patients = Patient.all
    @patient = Patient.new  # Initialize a new patient object for the form
  end

  private

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :dob, :address)
  end

  def require_receptionist
    role_name = current_user.role&.name # Get the role name
    Rails.logger.debug "User role: #{role_name}" # Log the role for debugging

    unless role_name == 'receptionist' # Check if the role is receptionist
      redirect_to root_path, alert: "Access denied."
    end
  end

end
