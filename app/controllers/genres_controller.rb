class GenresController < ApplicationController
  before_action :require_login

  def index
    @genre = Genre.new
  end

  def create
    @genre = current_user.genres.build(genre_params)
    if @genre.save
      redirect_to genres_path, notice: "「#{@genre.name}」をジャンルに登録しました。"
    else
      render :index, notice: "登録に失敗しました。"
    end
  end

  def update
    @genre = current_user.genres.find(params[:id])
    if @genre.update(genre_params)
      redirect_to @genre
    else
      render :edit
    end
  end

  def destroy
    @genre = current_user.genres.find(params[:id])
    @genre.destroy!
    redirect_to genres_path, notice: "ジャンル「#{@genre.name}」を削除しました"
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
