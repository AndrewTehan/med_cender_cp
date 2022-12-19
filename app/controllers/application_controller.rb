class ApplicationController < ActionController::Base
  include Pundit::Authorization

  devise_group :user, contains: [:admin, :doctor]
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  skip_before_action :verify_authenticity_token

  def user_not_authorized
    redirect_to(root_path)
  end

  def flash_message
    flash[:alert] = t 'flash.not_authorized'
    redirect_back(fallback_location: root_path)
  end

  rescue_from Pundit::NotAuthorizedError, with: :flash_message
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

  # protect_from_forgery with::exception

  def not_found_method
    render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:full_name, :phone_number, :email, :password) }
  end

  def handle_record_not_found
    render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
  end
end
