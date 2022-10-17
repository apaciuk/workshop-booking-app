# frozen_string_literal: true

class ApplicationController < ActionController::Base
  impersonates :user
  include Pundit::Authorization

  protect_from_forgery with: :exception

  #helper_method :current_user, :user_signed_in?, :is_admin?

  before_action :configure_permitted_parameters, if: :devise_controller?

 # def current_user
  #  @current_user ||= User.find(session[:user_id]) if session[:user_id]
 # end 

 # def user_signed_in? 
  #  !!current_user
 # end 

 # def is_admin?
 #   user_signed_in?  ? current_user.admin : false
 # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name avatar])
  end
end
