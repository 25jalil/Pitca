class ApplicationController < ActionController::Base
  before_action :configure_sign_up_parameters, if: :devise_controller?
  before_action :configure_update_parameters, if: :devise_controller?
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :permission_denied

  protect_from_forgery with: :exception

  private

    def permission_denied
      flash[:danger] = "No access"
      redirect_to (request.referrer || root_path)
    end

  def configure_sign_up_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def configure_update_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end  
end
