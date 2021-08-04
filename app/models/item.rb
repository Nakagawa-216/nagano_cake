class Item < ApplicationRecord
  attachment :image
  # enum is_active: { on_sale: true, stop_sale: false }
  belongs_to :genre
  def add_tax_price
    (self.price * 1.1).round
  end
end
