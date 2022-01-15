class ExamsController < ApplicationController

  def index
    @answers = Answer.where(exam: Time.current.to_date)
    current_user.status = "true"
    current_user.save!(status: true)
  end

  def show
    @answer = Answer.find(params[:id])
    @question = Question.find(params[:id])
  end


end
