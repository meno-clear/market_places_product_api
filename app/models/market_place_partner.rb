class MarketPlacePartner < ApplicationRecord
  belongs_to :user
  has_one_attached :logo
  has_many :addresses
  has_many :products
  has_many :cart_items
  has_many :orders
  enum status: { active: 0, inactive: 1 }
  belongs_to :user
end
