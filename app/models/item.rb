class Item < ApplicationRecord
  attachment :image
  # enum is_active: { on_sale: true, stop_sale: false }
  belongs_to :genre
  has_many :order_items
  has_many :cart_items
  def add_tax_price
    (self.price * 1.1).round
  end
end
