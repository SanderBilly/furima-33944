class ItemsController < ApplicationController
  def index
    if Item
      @items = Item.includes(:user).order("created_at DESC")
    end
  end
end
