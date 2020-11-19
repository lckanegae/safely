class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :address, :phone_number, :birth_date, :cpf, :email, :password, :nickname) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:address, :phone_number, :name, :email, :password, :current_password, :nickname) }
  end
end
