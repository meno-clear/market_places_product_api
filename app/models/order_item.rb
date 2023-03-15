class OrderItem < ApplicationRecord
  belongs_to :order, required: false
  belongs_to :cart_item, required: false
end
