class ExamsController < ApplicationController

  def index
    @answers = Answer.joins(:question).where(exam: Time.current.to_date).order(created_at: :desc).page(params[:page]).per(6)
    current_user.status = "true"
    current_user.save!(status: true)
  end


end
