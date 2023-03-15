class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.integer :price_in_cents
      t.integer :order_id
      t.integer :cart_item_id

      t.timestamps
    end
    add_index :order_items, :order_id
    add_index :order_items, :cart_item_id
  end
end
