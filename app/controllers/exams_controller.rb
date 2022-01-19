class ExamsController < ApplicationController

  def index
    @answers = Answer.where(exam: Time.current.to_date)
    current_user.status = "true"
    current_user.save!(status: true)
  end


end
