class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
    @addresses = Address.where(customer_id: current_customer.id)
  end

  def confirm
  end

  def complete
  end

  def create
  end

  def index
  end

  def show
  end
end
