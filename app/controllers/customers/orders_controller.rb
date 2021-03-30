class Customers::OrdersController < ApplicationController
  def index
  end

  def show
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
    @order.customer_id = current_cunstomer.id
    @order.delivery_fee = 800
    @order.total_fee = current_cunstomer.total_payment
    @order.payment = new_order_params[:payment]
    if new_order_params[:radio_address] == "own_address"
      @order.name = current_cunstomer.family_name + current_cunstomer.first_name
      @order.postal_code = current_cunstomer.postal_code
      @order.address = current_cunstomer.address
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
end
