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
  
    # Initialize age groups with default values
    @age_groups = {
      '0-5' => 0,
      '6-15' => 0,
      '16-25' => 0,
      '26-40' => 0,
      '41-60' => 0,
      '60+' => 0
    }
  
    # Populate age groups based on patient data
    @patients.each do |patient|
      age = calculate_age(patient.dob)  # Assume you have a method to calculate age
      case age
      when 0..5
        @age_groups['0-5'] += 1
      when 6..15
        @age_groups['6-15'] += 1
      when 16..25
        @age_groups['16-25'] += 1
      when 26..40
        @age_groups['26-40'] += 1
      when 41..60
        @age_groups['41-60'] += 1
      else
        @age_groups['60+'] += 1
      end
    end
  end
  
  private
  
  def calculate_age(dob)
    return 0 unless dob  # Handle nil date of birth
    ((Time.zone.now - dob) / 1.year.seconds).to_i
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
