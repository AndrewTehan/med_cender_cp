class DepartmentsController < ApplicationController
  before_action :find_medical_center, only: [:new, :show, :index, :edit, :update, :create, :destroy]
  before_action :find_department, only: [:show, :edit, :update, :destroy]
  before_action :authorize!, except: [:index]
  
  def index
    @departments = @medical_center.departments
  end

  def new; end

  def create
    @department = @medical_center.departments.new(department_params)

    if @department.save
      redirect_to medical_center_path(@medical_center)
    else
      render :new
    end
  end

  def show; end

  def edit; end
  
  def update
    if @department.update(department_params)
      redirect_to medical_center_department_path(@medical_center, @department)
    else
      render :edit
    end
  end
  
  def destroy
    @department.destroy
    redirect_to medical_center_path(@medical_center)
  end

  private
  
  def authorize!
    authorize(@department || Department)
  end

  def find_medical_center
    @medical_center = MedicalCenter.find(params[:medical_center_id])
  end

  def find_department
    @department = @medical_center.departments.find(params[:id])
  end

  def department_params
    params.require(:department).permit(:name, :description)
  end
end
