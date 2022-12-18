class MedicalCentersController < ApplicationController
  before_action :find_medical_center, only: [:show, :edit, :update, :destroy]
  before_action :authorize!, except: [:index]
  
  def index
    @medical_centers = MedicalCenter.all
    render json: @medical_centers
  end

  def new
    @medical_center = MedicalCenter.new
    binding.pry
  end

  def create
    @medical_center = MedicalCenter.new(medical_center_params)
    binding.pry
    if @medical_center.save
      render json: @medical_center
    else
      render json: @medical_center.errors
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

  def authorize!
    authorize(@medical_center || MedicalCenter)
  end

  def find_medical_center
    @medical_center = MedicalCenter.find(params[:id])
  end

  def medical_center_params
    params.require(:medical_center).permit(:email, :address, :schedule, :legal_entity)
  end
end
