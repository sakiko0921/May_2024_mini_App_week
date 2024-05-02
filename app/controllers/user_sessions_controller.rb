class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: user_params[:name])
    if user&.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to root_path, success: "ログインしました"
    else
      flash.now[:warning] = "ログインに失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, success: "ログアウトしました"
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
