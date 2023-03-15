json.extract! cart_item, :id, :product_name, :product_price_in_cents, :quantity, :cart_id, :product_id, :created_at, :updated_at
json.url cart_item_url(cart_item, format: :json)
