class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:email, :first_name, :last_name, :password, :password_confirmation)}
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def index
  end

end
