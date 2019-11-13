class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @memo = Memo.where(
      category_id: params[:id],
      user_id: @current_user.id
    )
  end
end
