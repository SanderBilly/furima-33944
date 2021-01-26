class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_user
  before_action :set_category, only: [:show, :d_confirm]
  before_action :search_item, only: [:show, :d_confirm]
  before_action :move_to_index, except: [:show]

  def show
    @items = Item.where(user_id: params[:id]).includes(:user).order("created_at DESC")
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  def d_confirm
  end

  private

  def user_params
    params.require(:user).permit(:avater, :nickname, :email, :introduce)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def move_to_index
    if current_user.id != @user.id
      redirect_to root_path
    end
  end
end
