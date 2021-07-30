class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|

      t.integer :customer_id, null: false
      t.string :name, null: false
      t.string :postal_code, null: false
      t.string :adress, null: false

      t.timestamps
    end
    add_foreign_key :customer_id, :customers
  end
end
