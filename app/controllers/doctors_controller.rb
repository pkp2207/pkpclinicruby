class DoctorsController < ApplicationController
  before_action :require_user
  before_action :require_doctor

  def dashboard
    @patients = Patient.all
    # Group patients by the day they were created to show registration data
    @patient_registration_data = Patient.group_by_day(:created_at).count

    @patient_registration_data = @patient_registration_data.map { |date, count| [date.to_s, count] }.to_h

  end

  private

  # Ensure the user is a doctor
    def require_doctor
      Rails.logger.debug "Current user: #{current_user.inspect}"
      redirect_to root_path unless current_user.role.name == 'doctor'
    end
end
