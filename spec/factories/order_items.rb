FactoryBot.define do
  factory :order_item do
    quantity { 1 }
    price_in_cents { 1 }
    order_id { 1 }
    cart_item_id { 1 }
  end
end
