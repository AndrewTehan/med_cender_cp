class VisitsController < ApplicationController 
  before_action :find_medical_center, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  before_action :find_department, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  before_action :find_doctor, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  before_action :find_visit, only: [:show, :edit, :update, :destroy]

  def index
    @visits = @doctor.visits
  end

  def new; end

  def create
    @visit = @doctor.visits.create(visit_params)
    redirect_to medical_center_department_doctor_visits_path(@medical_center, @department, @doctor)
  end

  def show; end

  def edit; end

  def update
    if @visit.update(visit_params)
      redirect_to medical_center_department_doctor_visit_path(@medical_center, @department, @doctor, @visit)
    else
      render :edit
    end
  end

  def destroy
    @visit.destroy
    redirect_to medical_center_department_doctor_visits_path(@medical_center, @department, @doctor)
  end

  private

  def find_medical_center
    @medical_center = MedicalCenter.find(params[:medical_center_id])
  end

  def find_department
    @department = @medical_center.departments.find(params[:department_id])
  end

  def find_doctor
    @doctor = @department.doctors.find(params[:doctor_id])
  end

  def find_visit
    @visit = @doctor.visits.find(params[:id])
  end

  def visit_params
    params.require(:visit).permit(:datetime, :doctor_id, :patient_id)
  end
end
