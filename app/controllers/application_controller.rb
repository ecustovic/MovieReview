class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

protected 
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])      
  end
    
private
  def current_user_admin?
    current_user && current_user.admin?
  end

  helper_method :current_user_admin?

  def require_signin
    unless current_user
        redirect_to new_session_url, alert: "Please sign in first!"
    end
  end

  def require_admin
    unless current_user_admin?
      redirect_to movies_url, alert: "Unauthorized access!"
    end
  end
end
