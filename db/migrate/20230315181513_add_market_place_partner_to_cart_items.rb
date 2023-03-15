class AddMarketPlacePartnerToCartItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :cart_items, :market_place_partner, null: false, foreign_key: true
  end
end
