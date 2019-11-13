class ApplicationController < ActionController::Base
  before_action :get_category
  before_action :set_current_user

  # before_action :get_user

  def get_category
    @categories = Category.all
  end
  
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def authenticate_user
    if @current_user == nil
      flash[:notice] = "ログインが必要です"
      redirect_to("/login")
    end
  end

  def forbid_login_user
    if @current_user
      flash[:notice] = "すでにログインしています"
      redirect_to("/memos/index")
    end
  end

  # def get_user
  #   @users = User.find(params[:id])
  # end
end
