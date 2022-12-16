class ApplicationController < ActionController::Base
  include Pundit::Authorization

  devise_group :user, contains: [:admin, :doctor]
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def user_not_authorized
    redirect_to(root_path)
  end

  def flash_message
    flash[:alert] = t 'flash.not_authorized'
    redirect_back(fallback_location: root_path)
  end

  rescue_from Pundit::NotAuthorizedError, with: :flash_message

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:full_name, :phone_number, :email, :password) }
  end
end
