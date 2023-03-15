# seed_data.rb
def create_users
  user = User.create!({
    first_name: 'John',
    last_name: 'Doe',
    email: 'johndoe@gmail.com',
    password: 123123
  })
  user
end


def create_products
  product = Product.create!({
  
    name: "Value",
  
    price_in_cents: 10,
  
  
  
  })
  product
end

def create_carts
  cart = Cart.create!({
  
    total: 10,
  
    price_in_cents: 10,
  
  
  
  })
  cart
end

def create_cart_items
  cart_item = CartItem.create!({
  
    product_name: "Value",
  
    product_price_in_cents: 10,
  
    quantity: 10,
  
  
    cart_id: carts.id,
  
    product_id: products.id,
  
  
  })
  cart_item
end

def create_orders
  order = Order.create!({
  
    total: 10,
  
    price_in_cents: 10,
  
  
    user_id: users.id,
  
    cart_id: carts.id,
  
  
  })
  order
end

def create_order_items
  order_item = OrderItem.create!({
  
    quantity: 10,
  
    price_in_cents: 10,
  
  
    order_id: orders.id,
  
    cart_item_id: cart_items.id,
  
  
  })
  order_item
end
