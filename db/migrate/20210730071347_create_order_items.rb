class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|

      t.integer :item_id, null: false
      t.integer :order_id, null: false
      t.integer :tax_price, null: false
      t.integer :amount, null: false
      t.integer :product_status, null: false, default: 0

      t.timestamps
    end
    add_foreign_key :item_id, :items
    add_foreign_key :order_id, :orders
  end
end
