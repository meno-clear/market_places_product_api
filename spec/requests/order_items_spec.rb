require 'swagger_helper'

RSpec.describe 'order_items', type: :request do
  let(:order_items) { create_order_items}


  let(:orders) { create_orders}

  let(:cart_items) { create_cart_items}


  let(:users) { create_users}
  let(:products) { create_products}
  let(:carts) { create_carts}
  before do
    order_items
  end

  path '/order_items' do
    
    get('list order_items') do
      produces 'application/json'

      response(200, 'successful') do

        run_test! do |response|
          data = JSON.parse(response.body)
          
          expect(data[0]['quantity']).to eql(OrderItem.first.quantity)
          
          expect(data[0]['price_in_cents']).to eql(OrderItem.first.price_in_cents)
          
          
          expect(data[0]['order_id']).to eql(OrderItem.first.order_id)
          
          expect(data[0]['cart_item_id']).to eql(OrderItem.first.cart_item_id)
          
        end
      end
    end

    post('create order_item') do
      produces 'application/json'
      consumes 'application/json'

      parameter name: :order_item, in: :body, schema:{
        type: :object,
        properties: {
          order_item: {
            type: :object,
            properties: {
            
              quantity: {type: :integer},
            
              price_in_cents: {type: :integer},
            
            
              order_id: {type: :integer},
            
              cart_item_id: {type: :integer},
            
            }
          }
        },
        required: [
        
          'quantity',
        
          'price_in_cents',
        
        
          'order_id',
        
          'cart_item_id',
        
        ]
      }

      response(201, 'successful') do

        let(:order_item) {{order_item: {
        
          quantity: 10,
        
          price_in_cents: 10,
        
        
          order_id: Order.first,
        
          cart_item_id: CartItem.first,
        
        }}}
          
        run_test! do |response|
          data=JSON.parse(response.body)
          
          expect(data['quantity']).to eql(10)
          
          expect(data['price_in_cents']).to eql(10)
          
        end
      end
    end
  end

  path '/order_items/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show order_item') do
      produces 'application/json'
      
      response(200, 'successful') do
        let(:id) { order_items.id}

        run_test! do |response|
          data = JSON.parse(response.body)
          
          expect(data['quantity']).to eql(OrderItem.first.quantity)
          
          expect(data['price_in_cents']).to eql(OrderItem.first.price_in_cents)
          
          
          expect(data['order_id']).to eql(OrderItem.first.order_id)
          
          expect(data['cart_item_id']).to eql(OrderItem.first.cart_item_id)
          
        end
      end
    end

    patch('update order_item') do
      produces 'application/json'
      consumes 'application/json'

      parameter name: :order_item, in: :body, schema:{
        type: :object,
        properties: {
           order_item: {
            type: :object,
            properties: {
            
              quantity: {type: :integer},
            
              price_in_cents: {type: :integer},
            
            
              order_id: {type: :integer},
            
              cart_item_id: {type: :integer},
            
            }
          }
        }
      }

      response(200, 'successful') do
        let(:id) { order_items.id}
        let(:order_item) {{order_item: {
        
          quantity: 300,
        
          price_in_cents: 300,
        
                                    }}}

        run_test! do |response|
          data=JSON.parse(response.body)
          
          expect(data['quantity']).to eql(300)
          
          expect(data['price_in_cents']).to eql(300)
          
        end
      end
    end

    put('update order_item') do
      produces 'application/json'
      consumes 'application/json'
      parameter name: :order_item, in: :body, schema:{
        type: :object,
        properties: {
           order_item: {
            type: :object,
            properties: {
            
              quantity: {type: :integer},
            
              price_in_cents: {type: :integer},
            
            
              order_id: {type: :integer},
            
              cart_item_id: {type: :integer},
            
            }
          }
        }
      }

      response(200, 'successful') do
        let(:id) { order_items.id}
        let(:order_item) {{order_item: {
          
          quantity: 300,
          
          price_in_cents: 300,
          
                                    }}} 

        run_test! do |response|
          data=JSON.parse(response.body)
          
          expect(data['quantity']).to eql(300)
          
          expect(data['price_in_cents']).to eql(300)
          
        end
      end
    end

    delete('delete order_item') do
      
      response(204, 'successful') do
        let(:id) { order_items.id}

        run_test! do |response|
          expect(response.status).to eql(204)
        end
      end
    end
  end
end
