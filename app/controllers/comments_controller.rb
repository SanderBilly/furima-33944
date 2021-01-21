class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category
  before_action :move_to_index

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to item_path(@comment.item)
    else
      @comments = @item.comments.includes(:user)
      render "items/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if @item.order != nil
      redirect_to root_path
    end
  end
end
