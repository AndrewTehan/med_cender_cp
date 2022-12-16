class DoctorsController < ApplicationController
  before_action :find_medical_center, only: [:new, :create, :show, :index, :edit, :update, :destroy]
  before_action :find_department, only: [:new, :create, :show, :index, :edit, :update, :destroy]
  before_action :find_doctor, only: [:show, :edit, :update, :destroy]
  before_action :authorize!
  
  def index
    redirect_to root_path unless @dp.index?
    @doctors = @department.doctors
  end

  def new
    redirect_to root_path unless @dp.create?
  end

  def create
    redirect_to root_path unless @dp.create?
    @doctor = @department.doctors.new(doctor_params)   
    
    if @doctor.save
      redirect_to medical_center_department_doctor_path(@medical_center, @department, @doctor)
    else
      render :new
    end
  end

  def show
    redirect_to root_path unless @dp.show?
  end

  def edit
    redirect_to root_path unless @dp.update?
  end

  def update
    redirect_to root_path unless @dp.update?

    if @doctor.update(doctor_params)
      redirect_to medical_center_department_doctor_path(@medical_center, @department, @doctor)
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path unless @dp.destroy?

    @doctor.destroy
    redirect_to medical_center_department_doctors_path(@medical_center, @department)
  end

  private

  def authorize!
    @dp = DoctorPolicy.new(current_user, @doctor || Doctor, @department)
  end

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
    params.require(:doctor).permit(:full_name, :phone_number, :email, :department_id, :password)
  end
end
