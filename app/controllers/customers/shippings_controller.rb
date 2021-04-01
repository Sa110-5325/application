class Customers::ShippingsController < ApplicationController
  def index
    @shippings = current_customer.shippings
    @shipping = Shipping.new
  end

  def edit
    @shipping = Shipping.find(params[:id])
  end

  def create
    @shippings = current_customer.shippings
    @shipping = Shipping.new(shipping_params)
    @shipping.customer_id = current_customer.id
    if @shipping.save
      redirect_to shippings_path
    else
      render "index"
    end
  end

  def update
    @shipping = Shipping.find(params[:id])
    if @shipping.update(shipping_params)
      redirect_to shippings_path
    else
      render "edit"
    end
  end

  def destroy
    @shipping = Shipping.find(params[:id])
    @shipping.destroy
    redirect_to shippings_path
  end

  private

  def shipping_params
    params.require(:shipping).permit(:postal_code, :address, :name)
  end
end
