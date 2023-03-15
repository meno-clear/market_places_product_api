class Order < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :cart, required: false
  belongs_to :market_place_partner, required: false
  enum status: { pending: 0, paid: 1, canceled: 2 }

 def market_place_partner_name
   market_place_partner.name
 end

  def price_in_cents # total price in cents
    order_items.map { |order_item| order_item.price_in_cents * order_item.quantity }.sum
  end

  def total # total price in cents
    order_items.map { |order_item| order_item.price_in_cents * order_item.quantity }.sum/100
  end

  has_many :order_items
end
