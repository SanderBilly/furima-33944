class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_item, except: [:index, :new, :create, :search]
  before_action :set_category, only: [:index, :show, :search]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :search_item, only: [:index, :show, :search]

  def index
    if Item.exists?
      @items = Item.includes(:user).order("created_at DESC")
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def search
    @search_content = params[:q][:name_cont]
    if @search.result.length != 0
      @items = @search.result.includes(:user).order("created_at DESC")
    end
  end

  private
  
  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    if current_user.id != @item.user.id || @item.order != nil
      redirect_to root_path
    end
  end

  def search_item
    @search = Item.ransack(params[:q])
  end
end