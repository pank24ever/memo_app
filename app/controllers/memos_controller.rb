class MemosController < ApplicationController
  

  def index
    @memo = Memo.where(user_id: @current_user.id)
  end
  
  def new
    @memo = Memo.new
  end

  def create
    @memo = Memo.create(
      title: params["memos"]["title"],
      body: params["memos"]["body"],
      category_id: params["memos"]["category_id"],
      user_id: @current_user.id
    )
    if @memo.save
      redirect_to "/memos/index"
      flash[:notice] = "投稿に成功しました"
    else
      render "/new"
    end
  end

  def destroy
    @memo = Memo.find(params[:id])
    @memo.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to "/memos/index"
  end

  def edit
    @memo = Memo.find(params[:id])
  end

  def update
    puts "error4"
    @memo = Memo.find(params[:id])
    @memo.title = params["memos"]["title"]
    @memo.body = params["memos"]["body"]
    @memo.category_id = params["memos"]["category_id"]
    @memo.save
    puts "error1"
    if @memo.save
      flash[:notice] = "投稿を編集しました"
      redirect_to "/memos/index"
    else
      puts "error2"
      render "/memos/:id/edit"
    end
  end
end
