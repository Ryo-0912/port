class QuestionsController < ApplicationController

  def index
    
  end

  def create
    @question = current_user.genre.questions.build(question_params)
    if @question.save
      redirect_to genres_path, notice: "「#{@question.statement}」をジャンルに登録しました。"
    else
      render :index, notice: "登録に失敗しました。"
    end
  end

  def new
    @genre = current_user.genres.find(params[:genre_id])
    @question = Question.new
  end

  def edit
  end

  def show
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end


  def question_params
    params.require(:question).permit(:statement, :image, :poor, :test)
  end
end
