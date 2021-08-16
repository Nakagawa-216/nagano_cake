class Admins::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to admin_order_path(order)
  end
end
