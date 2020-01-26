class SessionsController < ApplicationController
  before_action :forbid_login_user, {only: [:login_form, :login]}

  def loginform
  end

  def login
    @user = User.find_by(email: params["users"]["email"])
    if @user && @user.authenticate(params["users"]["password"])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to "/memos/index"
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      # @email = params[:email]
      # @password = params[:password]

      # レンダリングしてエラーメッセージだしたい…
      # render "/loginform"
      redirect_to "/loginform"
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to "/"
  end

  def show
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
