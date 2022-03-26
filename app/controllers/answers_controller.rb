class AnswersController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.build_answer(answer_params)
    if @answer.save
      flash[:success] = t('.success')
      redirect_to question_answer_path(@question, @answer)
    else
      render :new
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

  def updating
    @answer = Answer.find(params[:id])
    exam = params[:answer][:exam]
    @answer.exam = exam
    if @answer.save
      flash[:success] = t('.success')
      redirect_to genres_path
    else
      flash.now[:danger] = t('.fail')
      render :show
    end
  end

  private

    def answer_params
      params.require(:answer).permit(:solution, :process, :exam, :id)
    end
end
