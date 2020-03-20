class ApplicationController < ActionController::Base
  before_action :configure_devise_parameters, if: :devise_controller?

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :pasword_confirmation) }
  end

  def redirect_not_signed_in
    unless user_signed_in?
      flash[:alert] = "Veuillez vous connectez pour commander un boost."
      redirect_to new_user_session_path
    end
  end

end
