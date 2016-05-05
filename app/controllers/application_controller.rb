class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # to insert data into database
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name

    devise_parameter_sanitizer.for(:sign_up) << :dob
    devise_parameter_sanitizer.for(:account_update) << :dob

    devise_parameter_sanitizer.for(:sign_up) << :gender
    devise_parameter_sanitizer.for(:account_update) << :gender

    devise_parameter_sanitizer.for(:sign_up) << :role
    devise_parameter_sanitizer.for(:account_update) << :role

    devise_parameter_sanitizer.for(:sign_up) << :profile_picture
    devise_parameter_sanitizer.for(:account_update) << :profile_picture
  end

  #an error message for guest to make CRUD on  course or lecture
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied!"
    redirect_to root_url
  end
end
