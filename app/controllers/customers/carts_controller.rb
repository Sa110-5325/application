class Customers::CartsController < ApplicationController

  def index
    @carts = current_customer.carts
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
    @carts = current_customer.carts
    @carts.destroy_all
    redirect_to carts_path
  end

  def update
    @cart = Cart.find(params[:id])
    if cart_params[:quantity] == "0"
      @cart.destroy
    else
      @cart.quantity = cart_params[:quantity]
      @cart.save
    end
    redirect_to carts_path
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to carts_path
  end

  private

  def cart_params
    params.require(:cart).permit(:quantity, :item_id)
  end
end
