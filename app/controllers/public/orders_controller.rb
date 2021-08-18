class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @customer = current_customer
    @addresses = Address.where(customer_id: current_customer.id)
  end

  def confirm
    if params[:order][:select_address] == "0"
      @order = Order.new(order_params)
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name

    elsif params[:order][:select_address] == "1"
      @order = Order.new(order_params)
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else
      @order = Order.new(order_params)
    end

    @cart_items = current_customer.cart_items
    @order.postage = 800
    @sum = 0
    @cart_items.each do |cart_item|
      @sum += (cart_item.item.price * 1.1).floor * cart_item.amount
    end
  end

  def complete
  end
# binding.pry
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

    cart_items = current_customer.cart_items
    cart_items.each do |c|
      @order_items = OrderItem.new
      @order_items.order_id = @order.id
      @order_items.item_id = c.item.id
      @order_items.amount = c.amount
      @order_items.tax_price = (c.item.price * 1.1).floor
      @order_items.save
      # redirect_to thanks_path
    end

    cart_items.destroy_all
    redirect_to thanks_path
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])

  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :postage, :amount_of_payment)
  end
end
