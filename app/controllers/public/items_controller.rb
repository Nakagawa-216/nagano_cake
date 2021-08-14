class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = Cart_item.new(item_id: @item.id)
  end

  private
  def product_params
    params.require(:item).permit(:image_id, :name, :introduction)
  end
end
