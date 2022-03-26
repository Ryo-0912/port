class ExamsController < ApplicationController
  before_action :to_genres, only: [:index], if: :after_current_user_status


  def index
    @answers = Answer.joins({:question => :genre}).where(genres:{ user_id: current_user.id }, exam: Time.current.to_date).order(created_at: :desc).page(params[:page]).per(10)
    current_user.status = "true"
    current_user.save!(status: true)
  end

  private

  def after_current_user_status
    current_user.status == true
  end


end
