class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfar: 1 }
  enum order_status: { payment_waiting: 0, payment_confirm: 1, in_production: 2, preparing_delivery: 3, delivered: 4 }

  belongs_to :customer
  has_many :order_items


  def address_display
	  '〒' + postal_code + "　" + address + "　" + name
  end
end
