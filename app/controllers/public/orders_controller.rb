class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def index
    @orders = Order.all
  end

  def show
  end

  def create
    @order = Order.new(order_params)
    @order.save
    @cart_items = current_customer.cart_items.all

    @cart_items.each do |cart_item|
      @order_details = OrderDetail.new
      @order_details.order_id = @order.id
      @order_details.item_id = cart_item.item.id
      @order_details.price = cart_item.item.with_tax_price
      @order_details.amount = cart_item.amount
      @order_details.save
    end

    CartItem.destroy_all

    redirect_to  orders_complete_path
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "2"
      @order.customer_id = current_customer.id
    end
      @cart_items = current_customer.cart_items
      @order_new = Order.new
      render :confirm
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :customer_id, :billing_amount, :postage)
  end
end
