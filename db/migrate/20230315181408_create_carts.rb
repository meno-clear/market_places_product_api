class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.integer :total
      t.integer :price_in_cents

      t.timestamps
    end
  end
end
