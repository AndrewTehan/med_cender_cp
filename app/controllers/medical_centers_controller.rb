class MedicalCentersController < ApplicationController
  before_action :find_medical_center, only: [:show, :edit, :update, :destroy]
  
  def index
    @medical_centers = MedicalCenter.all
  end

  def new
    @medical_center = MedicalCenter.new
  end

  def create
    @medical_center = MedicalCenter.new(medical_center_params)

    if @medical_center.save
      redirect_to @medical_center
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @medical_center.update(medical_center_params)
      redirect_to @medical_center
    else
      render :edit
    end
  end

  def destroy
    @medical_center.destroy

    redirect_to root_path
  end

  private

  def find_medical_center
    @medical_center = MedicalCenter.find(params[:id])
  end

  def medical_center_params
    params.require(:medical_center).permit(:email, :address, :schedule, :legal_entity)
  end
end
