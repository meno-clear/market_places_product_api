class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :total
      t.integer :price_in_cents
      t.integer :user_id
      t.integer :cart_id

      t.timestamps
    end
    add_index :orders, :user_id
    add_index :orders, :cart_id
  end
end
