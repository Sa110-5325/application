class Customers::OrdersController < ApplicationController
  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order.customer_id = current_customer.id
    @carts = current_customer.carts
  end

  def new
    @shippings = Shipping.where(customer_id: current_customer)
  end

  def confirm
    if !new_order_params[:payment]
      redirect_to new_order_path
    end
    @new_order = Order.new
    @order = Order.new
    @order.customer_id = current_customer.id
    @order.delivery_fee = 800
    @order.total_fee = current_customer.total_payment
    @order.payment = new_order_params[:payment]
    if new_order_params[:radio_address] == "own_address"
      @order.name = current_customer.family_name + current_customer.first_name
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
    elsif
      new_order_params[:radio_address] = "registered_address"
      shipping = Shipping.find(new_order_params[:shipping])
      @order.name = shipping.name
      @order.postal_code = shipping.postal_code
      @order.address = shipping.address
    elsif
      new_order_params[:radio_address] == "new_address"
      @order.name = new_order_params[:new_name]
      @order.postal_code = new_order_params[:new_postal_code]
      @order.address = new_order_params[:new_address]
    end
  end

  def create
    if current_customer.carts.count > 0
      order = Order.new(order_params)
      order.customer_id = current_customer.id
      if order.save
      end

      if current_customer.carts.each do |cart|
          ordered_item = OrderedItem.new
          ordered_item.item_id = cart.item_id
          ordered_item.order_id = order.id
          ordered_item.quantity = cart.quantity
          ordered_item.price = cart.item.price
          ordered_item.save
        end
      end

      current_customer.carts.destroy_all
      redirect_to orders_finish_path
    else
      redirect_to carts_path
    end
  end

  def finish
  end

  private

  def new_order_params
    params.permit(:payment, :radio_address, :shipping, :new_postal_code, :new_address, :new_name)
  end

  def order_params
    params.require(:order).permit(:delivery_fee, :name, :postal_code, :address, :total_fee, :payment)
  end
end
