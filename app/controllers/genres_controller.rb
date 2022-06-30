class GenresController < ApplicationController
  before_action :require_login
  before_action :check_exam, only: [:index], if: :before_current_user_status # applicationコントローラーに記載

  def index
    @genre = Genre.new
  end

  def create
    @genre = current_user.genres.build(genre_params)
    if @genre.save
      flash[:success] = t('.success')
      redirect_to genres_path
    else
      flash.now[:danger] = t('.fail')
      render :index
    end
  end

  def edit
    @genre = current_user.genres.find(params[:id])
  end

  def update
    @genre = current_user.genres.find(params[:id])
    if @genre.update(genre_params)
      flash[:success] = t('.success')
      redirect_to genres_path
    else
      render :edit
    end
  end

  def destroy
    @genre = current_user.genres.find(params[:id])
    @genre.destroy!
    flash[:success] = t('.success')
    redirect_to genres_path
  end

  private

    def before_current_user_status
      if params[:status] == "false"
        current_user.update!(status: true)
        redirect_to genres_path
      end
      current_user.status == false
    end

    def genre_params
      params.require(:genre).permit(:name)
    end
end
