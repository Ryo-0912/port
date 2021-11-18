class PasswordResetsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:email])
    @user&.deliver_reset_password_instructions!
    redirect_to login_path
  end

  def edit
    @token = params[:id]
    # リクエストで送信されてきたトークンを使って、ユーザーの検索を行い, 有効期限のチェックも行う。
    # トークンが見つかり、有効であればそのユーザーオブジェクトを@userに格納する
    @user = User.load_from_reset_password_token(@token)
    return not_authenticated if @user.blank?
  end

  def update
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])
    return not_authenticated if @user.blank?
    # password_confirmation属性の有効性を確認
    @user.password_confirmation = params[:user][:password_confirmation]
    # change_passwordメソッドで、パスワードリセットに使用したトークンを削除し、パスワードを更新する
    if @user.change_password(params[:user][:password])
      redirect_to login_path, success: "成功しました"
    else
      flash.now[:danger] = "失敗しました"
      render :edit
    end
  end
end
