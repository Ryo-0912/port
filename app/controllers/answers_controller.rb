class AnswersController < ApplicationController
  def index
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.build_answer(answer_params)
    if @answer.save!
      redirect_to question_answer_path(@question, @answer)
      flash[:success] = t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :index
    end
  end

  def show
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
    @answer = @question.answer
  end

  def update
    @answer = Answer.find(params[:id])
    @question = @answer.question
    @answer.update!(answer_params)
    redirect_to question_path(@question)
  end

  private
  def answer_params
    params.require(:answer).permit(:solution, :process, :id)
  end

end
