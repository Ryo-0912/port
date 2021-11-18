class ApplicationController < ActionController::Base
  helper_method :current_user

  protected

  def not_authenticated
    redirect_to login_url
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
