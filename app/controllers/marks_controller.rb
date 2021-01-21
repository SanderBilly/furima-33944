class MarksController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index


  def create
    @mark = Mark.new(user_id: current_user.id, item_id: params[:item_id])
    @mark.save
    redirect_to item_path(params[:item_id])
  end

  def destroy
    @mark = Mark.find_by(user_id: current_user.id, item_id: params[:item_id])
    @mark.destroy
    redirect_to item_path(params[:item_id])
  end

  private

  def move_to_index
    @item = Item.find(params[:item_id])
    if @item.order != nil
      redirect_to root_path
    end
  end
end
