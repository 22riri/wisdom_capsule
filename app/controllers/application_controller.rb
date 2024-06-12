class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: %i[media username])
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[media username])
  end
end
