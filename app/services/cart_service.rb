class CartService
  def self.checkout(id, user_id)
    cart = Cart.find(id)
    item_groups = cart.cart_items.group_by { |cart_item| cart_item.market_place_partner_id }.values

    item_groups.each do |item_group|
      order = Order.new
      order.user_id = user_id
      order.market_place_partner_id = item_group.first.market_place_partner_id
      order.save
      
      item_group.each do |cart_item|
        order.order_items.create!(
          cart_item_id: cart_item.id,
          order_id: order.id,
          quantity: cart_item.quantity,
          price_in_cents: cart_item.product_price_in_cents,
         )
      end
    end
  end

  def self.handle_cart(cart_item_id, action_type, cart_item_params, cart_id)

    if cart_item_id.present? && action_type != 'create_item'
      cart_item = CartItem.find(cart_item_id)
    end

    case action_type
      when 'handle_quantity'
        cart_item.update(quantity: cart_item_params[:quantity])
      when 'create_item'
        cart_item = CartItem.new(cart_item_params)
        cart_item.cart_id = cart_id
        cart_item.save
      when 'remove_item'
        cart_item.destroy
    end
  end
end