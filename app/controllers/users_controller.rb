class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:edit, :update]}
  before_action :forbid_login_user, {only: [:new, :create]}
  before_action :ensure_correct_user, {only: [:edit,:update]}

  def new
  end

  def create
    @user = User.create(
      name: params["users"]["name"],
      email: params["users"]["email"],
      password: params["users"]["password"]
    )
    if  @user.save
      session[:user_id] = @user.id
      redirect_to "/memos/index"
    else
      flash.now[:notice] = "すでに登録されているか、入力が間違っています"
      render "/users/new"
    end
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    @user.name = params["users"]["name"]
    @user.email = params["users"]["email"]
    @user.password = params["users"]["password"]
    @user.save
    if @user.save
      flash[:notice] = "プロフィールを編集しました"
      redirect_to "/memos/index"
    else
      render "/users/:id/edit"
    end
  end

  def show
  end

  #なぜか誤作動する…
  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to "/memos/index"
    end
  end
end
