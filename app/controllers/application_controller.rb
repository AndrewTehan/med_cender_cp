class ApplicationController < ActionController::Base
  before_action :authenticate_admin!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:full_name, :phone_number, :email, :password) }
  end

  def user_not_authorized
    redirect_to(request.referrer || rootpath)
  end
end
