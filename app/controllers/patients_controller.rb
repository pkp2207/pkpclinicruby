class PatientsController < ApplicationController
  before_action :require_user
  before_action :require_receptionist

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to receptionist_dashboard_path
    else
      render :new
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update(patient_params)
      redirect_to receptionist_dashboard_path
    else
      render :edit
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy
    redirect_to receptionist_dashboard_path
  end

  private

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :dob, :address)
  end
end
