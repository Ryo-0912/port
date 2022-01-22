class SessionsController < ApplicationController
  def new

  end

  def create
    @user = login(params[:email], params[:password])

    if @user.save

      redirect_back_or_to genres_path
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
