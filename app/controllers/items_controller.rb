class ItemsController < ApplicationController
  def index
    if Item.exists?
      @items = Item.includes(:user).order("created_at DESC")
    end
  end

  def new

  end

  def create
    
  end
end
