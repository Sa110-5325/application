class Admin::ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end
  
  def show
  end
  
  def edit
  end
  
  def new
    @item = Item.new
    @genres = Genre.all
  end
  
  def create
    @genres = Genre.all
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path(@item)
    else
      render "new"
    end
  end
  
  def update
  end
  
  private
  
  def item_params
    params.require(:item).permit(:image, :name, :info, :genre_id, :price, :status)
  end
end
