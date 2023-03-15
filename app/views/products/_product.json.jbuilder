json.extract! product, :id, :name, :price_in_cents, :market_place_partner_id, :created_at, :updated_at
json.market_place_name product.market_place_partner.name
json.url product_url(product, format: :json)
