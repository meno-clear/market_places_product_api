json.extract! cart, :id, :total, :price_in_cents, :created_at, :updated_at
json.total_items cart.total_items
json.cart_items cart.cart_items.map { |cart_item| {
  id: cart_item.id,
  product_id: cart_item.product_id,
  product_name: cart_item.product.name,
  product_price_in_cents: cart_item.product_price_in_cents,
  quantity: cart_item.quantity,
  market_place_partner_id: cart_item.market_place_partner_id,
  total_price_in_cents: cart_item.product_price_in_cents * cart_item.quantity,
  total_price: cart_item.product_price_in_cents * cart_item.quantity/100
}}.sort_by { |cart_item| cart_item[:name] }
json.market_place_partners cart.cart_items.map { |cart_item| {
  name: cart_item.market_place_partner.name,
  id: cart_item.market_place_partner.id
}}.uniq.sort_by { |market_place_partner| market_place_partner[:name] }
json.url cart_url(cart, format: :json)
