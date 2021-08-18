class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
    @total_price = @cart_items.sum{|cart_item|cart_item.item.price * cart_item.amount * 1.1 }
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item =CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    cart_items = current_customer.cart_items
    cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    @cart_items = current_customer.cart_items

    if @cart_items.find_by(item_id: params[:item_id])
      @cart_item = @cart_items.find_by(item_id: params[:item_id])
      @cart_item.amount = @cart_item.amount + cart_item_params[:amount].to_i
      @cart_item.save
      flash.now[:notice] = "#{@cart_item.item.name}をカートに追加しました"
      redirect_to cart_items_path
    else
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      @cart_item.item_id = params[:item_id]

      if @cart_item.save
        flash.now[:notice] = "#{@cart_item.item.name}をカートに追加しました"
        redirect_to cart_items_path
      else
        flash.now[:alert] = "個数を選択してください"
        @item = Item.find(@cart_item.item.id)
        render template: "public/items/show" and return
      end
    end
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id, :customer_id)
  end
end
