class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|

      t.integer :item_id, null: false
      t.integer :customer_id, null: false
      t.integer :amount, null: false

      t.timestamps
    end
    add_foreign_key :item_id, :items
    add_foreign_key :customer_id, :customers
  end
end
