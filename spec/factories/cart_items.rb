FactoryBot.define do
  factory :cart_item do
    product_name { "MyString" }
    product_price_in_cents { 1 }
    quantity { 1 }
    cart_id { 1 }
    product_id { 1 }
  end
end
