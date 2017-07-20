class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :permission_denied

  protect_from_forgery with: :exception

  private

    def permission_denied
      flash[:danger] = "No access"
      redirect_to (request.referrer || root_path)
    end
end
