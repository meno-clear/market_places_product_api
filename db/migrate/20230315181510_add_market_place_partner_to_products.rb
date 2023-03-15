class AddMarketPlacePartnerToProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :market_place_partner, null: false, foreign_key: true
  end
end
