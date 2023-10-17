class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_detail = @order.order_details
    @total = 0
    @order_detail.each do |order_detail|
      subtotal = order_detail.item.with_tax_price * order_detail.amount
      @total += subtotal
    end
  end

   private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :customer_id, :billing_amount, :postage)
  end
end
