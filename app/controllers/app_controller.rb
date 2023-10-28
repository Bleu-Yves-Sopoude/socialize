class AppController < ApplicationController
  include CanCan::ControllerAdditions
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :role, :email, :bio, :photo, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :bio, :photo, :password, :current_password)
    end
  end
  helper_method :current_user

  def current_user
    User.first
  end
end
