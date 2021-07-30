class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.integer :customer_id, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.integer :postage, null: false
      t.integer :amount_of_payment, null: false
      t.integer :payment_method, null: false, default: 0
      t.integer :order_status, null: false, default: 0

      t.timestamps
    end
    add_foreign_key :customer_id, :customers
  end
end
