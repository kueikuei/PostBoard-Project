class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_admin, :admin_logged_in?, :current_user, :user_logged_in?
  
  def current_admin
     @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end

  def admin_logged_in?
    !!current_admin
  end

  def current_user
     @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_logged_in?
    !!current_user
  end


end
