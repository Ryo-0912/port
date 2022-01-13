class ExamsController < ApplicationController

  def index
    @answers = Answer.where(exam: "2022/01/10")
    current_user.status = "true"
    current_user.save!(status: true)
  end

  def show
  end


end
