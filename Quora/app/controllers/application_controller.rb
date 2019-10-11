class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	
protected

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit({ roles: [] }, :name,:email, :password, :password_confirmation) }
  devise_parameter_sanitizer.permit(:account_update) { |u| u.permit({ roles: [] }, :name,:email, :password, :password_confirmation,:avatar) }
  


  
end
	
end
