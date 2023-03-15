FactoryBot.define do
  factory :order do
    total { 1 }
    price_in_cents { 1 }
    user_id { 1 }
    cart_id { 1 }
  end
end
