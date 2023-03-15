require 'swagger_helper'

RSpec.describe 'orders', type: :request do
  let(:orders) { create_orders}


  let(:users) { create_users}

  let(:carts) { create_carts}


  before do
    orders
  end

  path '/orders' do
    
    get('list orders') do
      produces 'application/json'

      response(200, 'successful') do

        run_test! do |response|
          data = JSON.parse(response.body)
          
          expect(data[0]['total']).to eql(Order.first.total)
          
          expect(data[0]['price_in_cents']).to eql(Order.first.price_in_cents)
          
          
          expect(data[0]['user_id']).to eql(Order.first.user_id)
          
          expect(data[0]['cart_id']).to eql(Order.first.cart_id)
          
        end
      end
    end

    post('create order') do
      produces 'application/json'
      consumes 'application/json'

      parameter name: :order, in: :body, schema:{
        type: :object,
        properties: {
          order: {
            type: :object,
            properties: {
            
              total: {type: :integer},
            
              price_in_cents: {type: :integer},
            
            
              user_id: {type: :integer},
            
              cart_id: {type: :integer},
            
            }
          }
        },
        required: [
        
          'total',
        
          'price_in_cents',
        
        
          'user_id',
        
          'cart_id',
        
        ]
      }

      response(201, 'successful') do

        let(:order) {{order: {
        
          total: 10,
        
          price_in_cents: 10,
        
        
          user_id: User.first,
        
          cart_id: Cart.first,
        
        }}}
          
        run_test! do |response|
          data=JSON.parse(response.body)
          
          expect(data['total']).to eql(10)
          
          expect(data['price_in_cents']).to eql(10)
          
        end
      end
    end
  end

  path '/orders/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show order') do
      produces 'application/json'
      
      response(200, 'successful') do
        let(:id) { orders.id}

        run_test! do |response|
          data = JSON.parse(response.body)
          
          expect(data['total']).to eql(Order.first.total)
          
          expect(data['price_in_cents']).to eql(Order.first.price_in_cents)
          
          
          expect(data['user_id']).to eql(Order.first.user_id)
          
          expect(data['cart_id']).to eql(Order.first.cart_id)
          
        end
      end
    end

    patch('update order') do
      produces 'application/json'
      consumes 'application/json'

      parameter name: :order, in: :body, schema:{
        type: :object,
        properties: {
           order: {
            type: :object,
            properties: {
            
              total: {type: :integer},
            
              price_in_cents: {type: :integer},
            
            
              user_id: {type: :integer},
            
              cart_id: {type: :integer},
            
            }
          }
        }
      }

      response(200, 'successful') do
        let(:id) { orders.id}
        let(:order) {{order: {
        
          total: 300,
        
          price_in_cents: 300,
        
                                    }}}

        run_test! do |response|
          data=JSON.parse(response.body)
          
          expect(data['total']).to eql(300)
          
          expect(data['price_in_cents']).to eql(300)
          
        end
      end
    end

    put('update order') do
      produces 'application/json'
      consumes 'application/json'
      parameter name: :order, in: :body, schema:{
        type: :object,
        properties: {
           order: {
            type: :object,
            properties: {
            
              total: {type: :integer},
            
              price_in_cents: {type: :integer},
            
            
              user_id: {type: :integer},
            
              cart_id: {type: :integer},
            
            }
          }
        }
      }

      response(200, 'successful') do
        let(:id) { orders.id}
        let(:order) {{order: {
          
          total: 300,
          
          price_in_cents: 300,
          
                                    }}} 

        run_test! do |response|
          data=JSON.parse(response.body)
          
          expect(data['total']).to eql(300)
          
          expect(data['price_in_cents']).to eql(300)
          
        end
      end
    end

    delete('delete order') do
      
      response(204, 'successful') do
        let(:id) { orders.id}

        run_test! do |response|
          expect(response.status).to eql(204)
        end
      end
    end
  end
end
