class QuestionsController < ApplicationController

  def index
    
  end

  def create
    @question = genre.questions.build(question_params)
    if @question.save
      redirect_to genres_path, notice: "「#{@question.statement}」をジャンルに登録しました。"
    else
      render :index, notice: "登録に失敗しました。"
    end
  end

  def new
    @genre = Genre.find(params[:genre_id])
    @question = Question.new
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
