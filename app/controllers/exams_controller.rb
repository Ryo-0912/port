class ExamsController < ApplicationController

  def index
    @answers = Answer.where(exam: "2022/01/10")
    current_user.status = "true"
    current_user.status.update
    binding.irb
  end

  def show
  end

end
