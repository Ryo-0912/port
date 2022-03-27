class ApplicationController < ActionController::Base

  protect_from_forgery
  add_flash_types :success, :info, :warning, :danger
  helper_method :current_user
  require 'mechanize'

  AGENT = Mechanize.new
  BASE_URL = 'https://www.lemoda.net/tools/numbers/index.ja.cgi'

  def to_eisuji(number)
    AGENT.get(BASE_URL + number).search('#english-container p').first.inner_text
  end

  private

    def check_exam
      @answers = Answer.joins({:question => :genre}).where(genres:{ user_id: current_user.id }, exam: Time.current.to_date)
      if @answers.present?
        redirect_to exams_path
      end
    end

    def to_genres
      if current_user.status == true
        redirect_to genres_path
      end
    end

    def not_authenticated
      redirect_to login_url
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
end
