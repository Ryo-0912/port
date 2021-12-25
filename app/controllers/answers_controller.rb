class AnswersController < ApplicationController
  def index
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    question = Question.find(params[:question_id])
    @answer = question.answer.build(answer_params)
    if @answer.save
      redirect_to question_path(answer_id: @answer.id)
    else
      render :index, notice: "登録に失敗しました。"
    end
  end

  def show
  end

  def edit
  end


  private
  def answer_params
    params.require(:answer).permit(:question_id, :answer, :process)
  end

end
