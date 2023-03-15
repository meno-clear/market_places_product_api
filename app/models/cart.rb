class Cart < ApplicationRecord
  def total_items
    cart_items.sum(:quantity)
  end

has_many :cart_items, dependent: :destroy
  def total_items
    cart_items.sum(:quantity)
  end

end
