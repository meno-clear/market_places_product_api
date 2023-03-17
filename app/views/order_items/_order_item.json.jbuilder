json.extract! order_item, :id, :quantity, :price_in_cents, :order_id, :cart_item_id, :created_at, :updated_at
json.cart_item order_item.cart_item
json.url order_item_url(order_item, format: :json)
