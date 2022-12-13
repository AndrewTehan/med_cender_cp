class VisitsController < ApplicationController 
  def index
    @medical_center = MedicalCenter.find(params[:medical_center_id])
    @department = @medical_center.departments.find(params[:department_id])
    @doctor = @department.doctors.find(params[:doctor_id])
    @visits = @doctor.visits
  end

  def new
    @medical_center = MedicalCenter.find(params[:medical_center_id])
    @department = @medical_center.departments.find(params[:department_id])
    @doctor = @department.doctors.find(params[:doctor_id])
  end

  def create
    @medical_center = MedicalCenter.find(params[:medical_center_id])
    @department = @medical_center.departments.find(params[:department_id])
    @doctor = @department.doctors.find(params[:doctor_id])
    binding.pry
    @visit = @doctor.visits.create(visit_params)
    redirect_to medical_center_department_doctor_visits_path(@medical_center, @department, @doctor)
  end

  def show
    @medical_center = MedicalCenter.find(params[:medical_center_id])
    @department = @medical_center.departments.find(params[:department_id])
    @doctor = @department.doctors.find(params[:doctor_id])
    @visit = @doctor.visits.find(params[:id])
  end

  def edit
    @medical_center = MedicalCenter.find(params[:medical_center_id])
    @department = @medical_center.departments.find(params[:department_id])
    @doctor = @department.doctors.find(params[:doctor_id])
    @visit = @doctor.visits.find(params[:id])
  end

  def update
    @medical_center = MedicalCenter.find(params[:medical_center_id])
    @department = @medical_center.departments.find(params[:department_id])
    @doctor = @department.doctors.find(params[:doctor_id])
    @visit = @doctor.visits.find(params[:id])
    if @visit.update(visit_params)
      redirect_to medical_center_department_doctor_visit_path(@medical_center, @department, @doctor, @visit)
    else
      render :edit
    end
  end

  def destroy
    @medical_center = MedicalCenter.find(params[:medical_center_id])
    @department = @medical_center.departments.find(params[:department_id])
    @doctor = @department.doctors.find(params[:doctor_id])
    @visit = @doctor.visits.find(params[:id])
    @visit.destroy
    redirect_to medical_center_department_doctor_visits_path(@medical_center, @department, @doctor)
  end

  private

  def visit_params
    params.require(:visit).permit(:datetime, :doctor_id, :patient_id)
  end
end
