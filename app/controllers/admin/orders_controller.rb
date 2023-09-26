class Admin::OrdersController < ApplicationController
  def show
    @orders = Orders.all
  end
end
