class CreateCartItems < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_items do |t|
      t.string :product_name
      t.integer :product_price_in_cents
      t.integer :quantity
      t.integer :cart_id
      t.integer :product_id

      t.timestamps
    end
    add_index :cart_items, :cart_id
    add_index :cart_items, :product_id
  end
end
