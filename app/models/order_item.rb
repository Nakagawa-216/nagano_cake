class OrderItem < ApplicationRecord
  enum product_status: { 着手不可: 0, 製作待ち: 1, 製作中: 2, 製作完了: 3 }

  belongs_to :order
  belongs_to :item
  def add_tax_price
    (self.price * 1.1).round
  end
end
