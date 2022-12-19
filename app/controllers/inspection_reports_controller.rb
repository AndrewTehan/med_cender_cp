class InspectionReportsController < ApplicationController
  before_action :find_medical_center, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  before_action :find_department, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  before_action :find_doctor, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  before_action :find_visit, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  before_action :find_inspection_report, only: [:show, :edit, :update, :destroy]

  def index
    @inspection_reports = @visit.inspection_reports
  end

  def new; end

  def create
    @inspection_report = @visit.inspection_reports.create(inspection_report_params)
    report_path = medical_center_department_doctor_visit_inspection_report_url(@medical_center, @department, @doctor, @visit, @inspection_report)

    ReportNotificationsMailer.with(doctor: @doctor, patient: @visit.patient, report_path: report_path, visit: @visit).report_created.deliver_later

    redirect_to report_path
  end

  def show; end

  def edit; end

  def update
    if @inspection_report.update(inspection_report_params)
      report_path = medical_center_department_doctor_visit_inspection_report_url(@medical_center, @department, @doctor, @visit, @inspection_report)

      ReportNotificationsMailer.with(doctor: @doctor, patient: @visit.patient, report_path: report_path, visit: @visit).report_updated.deliver_later

      redirect_to report_path
    else
      render :edit
    end
  end

  def destroy
    @inspection_report.destroy
    redirect_to medical_center_department_doctor_visit_inspection_reports_path(@medical_center, @department, @doctor, @visit)
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
    @visit = @doctor.visits.find(params[:visit_id])
  end

  def find_inspection_report
    @inspection_report = @visit.inspection_reports.find(params[:id])
  end

  def inspection_report_params
    params.require(:inspection_report).permit(:medical_report, :medical_appointment, :visit_id)
  end
end
