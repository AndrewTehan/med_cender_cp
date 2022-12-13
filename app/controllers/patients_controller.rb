class PatientsController < ApplicationController
  before_action :find_medical_center, only: [:new, :show, :index, :edit, :update, :create, :destroy]
  before_action :find_patient, only: [:show, :edit, :update, :destroy]
  
  def index
    @patients = @medical_center.patients
  end

  def new; end

  def create
    @patient = @medical_center.patients.create(patient_params)
    redirect_to medical_center_patient_path(@medical_center, @patient)
  end

  def edit; end

  def show; end
  
  def update
    if @patient.update(patient_params)
      redirect_to medical_center_patient_path(@medical_center, @patient)
    else
      render :edit
    end
  end

  def destroy
    @patient.destroy
    redirect_to medical_center_patients_path(@medical_center)
  end

  private
  
  def find_medical_center
    @medical_center = MedicalCenter.find(params[:medical_center_id])
  end

  def find_patient
    @patient = @medical_center.patients.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:full_name, :phone_number, :email, :passport_number)
  end
end
