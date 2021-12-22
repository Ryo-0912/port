class ApplicationController < ActionController::Base
  helper_method :current_user
  require 'mechanize'

  AGENT = Mechanize.new
  BASE_URL = 'https://www.lemoda.net/tools/numbers/index.ja.cgi'

  def to_eisuji(number)
    AGENT.get(BASE_URL + number).search('#english-container p').first.inner_text
  end

  protected

  def not_authenticated
    redirect_to login_url
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

end
