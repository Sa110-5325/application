class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @genres = Genre.all
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
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
