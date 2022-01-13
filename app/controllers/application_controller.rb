class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  helper_method :current_user
  require 'mechanize'

  AGENT = Mechanize.new
  BASE_URL = 'https://www.lemoda.net/tools/numbers/index.ja.cgi'

  def to_eisuji(number)
    AGENT.get(BASE_URL + number).search('#english-container p').first.inner_text
  end

  protected

  def current_user_status
    current_user.status == false #exams_index_pathにアクセスしたらstatusをtrueにすればいい
  end

  def check_exam
    @answers = Answer.where(exam: "2022/01/10")
    if @answers.present?
      redirect_to exams_index_path
    end
  end

  def not_authenticated
    redirect_to login_url
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

end
