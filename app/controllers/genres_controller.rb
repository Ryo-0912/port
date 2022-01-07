class GenresController < ApplicationController
  before_action :require_login

  def index
    @genre = Genre.new
  end

  def create
    @genre = current_user.genres.build(genre_params)
    if @genre.save
      redirect_to genres_path
      flash[:success] = t('.success')
    else
      render :index
      flash.now[:danger] = t('.fail')
    end
  end

  def edit
    @genre = current_user.genres.find(params[:id])
  end

  def update
    @genre = current_user.genres.find(params[:id])
    if @genre.update(genre_params)
      redirect_to genres_path
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
