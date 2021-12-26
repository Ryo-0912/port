class QuestionsController < ApplicationController

  def index
    @questions = Question.all.includes(:genre).order(created_at: :desc).page(params[:page]).per(2)
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
  end

  def show
  end

  def upgate
  end

  def destroy
  end

  private

  def question_params
    params.require(:question).permit(:genre_id, :statement, :image, :poor, :test)
  end
end