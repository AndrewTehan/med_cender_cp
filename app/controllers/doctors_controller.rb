class DoctorsController < ApplicationController
  before_action :find_medical_center, only: [:new, :create, :show, :index, :edit, :update, :destroy]
  before_action :find_department, only: [:new, :create, :show, :index, :edit, :update, :destroy]
  before_action :find_doctor, only: [:show, :edit, :update, :destroy]

  def index
    @doctors = @department.doctors
  end

  def new; end

  def create
    @doctor = @department.doctors.create(doctor_params)
    redirect_to medical_center_department_doctor_path(@medical_center, @department, @doctor)
  end

  def show; end

  def edit; end

  def update
    if @doctor.update(doctor_params)
      redirect_to medical_center_department_doctor_path(@medical_center, @department, @doctor)
    else
      render :edit
    end
  end

  def destroy
    @doctor.destroy
    redirect_to medical_center_department_doctors_path(@medical_center, @department)
  end

  private

  def find_medical_center
    @medical_center = MedicalCenter.find(params[:medical_center_id])
  end

  def find_department
    @department = @medical_center.departments.find(params[:department_id])
  end

  def find_doctor
    @doctor = @department.doctors.find(params[:id])
  end
  
  def doctor_params
    params.require(:doctor).permit(:full_name, :phone_number, :email, :department_id)
  end
end
