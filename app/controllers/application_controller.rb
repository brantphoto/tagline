class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from Mongoid::Errors::DocumentNotFound do redirect_to root_url end
  rescue_from ActionView::MissingTemplate do redirect_to root_url end

  helper_method :current_user

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
