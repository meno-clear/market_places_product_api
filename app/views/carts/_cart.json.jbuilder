json.extract! cart, :id, :total, :price_in_cents, :created_at, :updated_at
json.url cart_url(cart, format: :json)
