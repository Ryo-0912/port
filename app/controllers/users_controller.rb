class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = current_user
  end

  def edit
  end

  # /users/new
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path
    else
      render :new #/users
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :remember_me)
  end
end
