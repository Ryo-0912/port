class QuestionsController < ApplicationController

  def index
    @questions = Question.all.includes(:genre).order(created_at: :desc).page(params[:page]).per(4)
  end

  def review_index
    @questions = Question.where(poor: true).order(created_at: :desc)
  end

  def new

    @genre = Genre.find(params[:genre_id])
    @question = Question.new
  end

  def create
    genre = Genre.find(params[:genre_id])
    @question = genre.questions.build(question_params)
    if @question.save
      redirect_to new_question_answer_path(@question)
    else
      render :index, notice: "登録に失敗しました。"
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def show
    @question = Question.find(params[:id])
    @answer = @question.answer
  end

  def update
    @question = Question.find(params[:id])
    @question.update!(question_params)
    redirect_to question_path(@question)
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy!
  end

  private

  def question_params
    params.require(:question).permit(:genre_id, :statement, :image, :poor, :test)
  end
end
