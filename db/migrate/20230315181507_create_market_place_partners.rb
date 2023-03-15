class CreateMarketPlacePartners < ActiveRecord::Migration[7.0]
  def change
    create_table :market_place_partners do |t|
      t.string :name
      t.string :email
      t.string :cnpj
      t.integer :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
