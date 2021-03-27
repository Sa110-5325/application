class Customers::CartsController < ApplicationController
  
  def index
  end

  def create
    @cart = Cart.new(cart_params)
    @cart.customer_id = current_customer.id
    @cart_add = Cart.find_by(item: @cart.item)
    if @cart_add.present?
      @cart.quantity += @cart_add.quantity
      @cart_add.destroy
    end
    if @cart.save
      redirect_to carts_path
    else
      @item = Item.find(params[:id])
      @cart = Cart.new
      render "show"
    end
  end

  def all_destroy
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
  def cart_params
    params.require(:cart).permit(:quantity, :item_id)
  end
end
