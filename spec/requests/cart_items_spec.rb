require 'swagger_helper'

RSpec.describe 'cart_items', type: :request do
  let(:cart_items) { create_cart_items}


  let(:carts) { create_carts}

  let(:products) { create_products}


  before do
    cart_items
  end

  path '/cart_items' do
    
    get('list cart_items') do
      produces 'application/json'

      response(200, 'successful') do

        run_test! do |response|
          data = JSON.parse(response.body)
          
          expect(data[0]['product_name']).to eql(CartItem.first.product_name)
          
          expect(data[0]['product_price_in_cents']).to eql(CartItem.first.product_price_in_cents)
          
          expect(data[0]['quantity']).to eql(CartItem.first.quantity)
          
          
          expect(data[0]['cart_id']).to eql(CartItem.first.cart_id)
          
          expect(data[0]['product_id']).to eql(CartItem.first.product_id)
          
        end
      end
    end

    post('create cart_item') do
      produces 'application/json'
      consumes 'application/json'

      parameter name: :cart_item, in: :body, schema:{
        type: :object,
        properties: {
          cart_item: {
            type: :object,
            properties: {
            
              product_name: {type: :string},
            
              product_price_in_cents: {type: :integer},
            
              quantity: {type: :integer},
            
            
              cart_id: {type: :integer},
            
              product_id: {type: :integer},
            
            }
          }
        },
        required: [
        
          'product_name',
        
          'product_price_in_cents',
        
          'quantity',
        
        
          'cart_id',
        
          'product_id',
        
        ]
      }

      response(201, 'successful') do

        let(:cart_item) {{cart_item: {
        
          product_name: "Value",
        
          product_price_in_cents: 10,
        
          quantity: 10,
        
        
          cart_id: Cart.first,
        
          product_id: Product.first,
        
        }}}
          
        run_test! do |response|
          data=JSON.parse(response.body)
          
          expect(data['product_name']).to eql("Value")
          
          expect(data['product_price_in_cents']).to eql(10)
          
          expect(data['quantity']).to eql(10)
          
        end
      end
    end
  end

  path '/cart_items/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show cart_item') do
      produces 'application/json'
      
      response(200, 'successful') do
        let(:id) { cart_items.id}

        run_test! do |response|
          data = JSON.parse(response.body)
          
          expect(data['product_name']).to eql(CartItem.first.product_name)
          
          expect(data['product_price_in_cents']).to eql(CartItem.first.product_price_in_cents)
          
          expect(data['quantity']).to eql(CartItem.first.quantity)
          
          
          expect(data['cart_id']).to eql(CartItem.first.cart_id)
          
          expect(data['product_id']).to eql(CartItem.first.product_id)
          
        end
      end
    end

    patch('update cart_item') do
      produces 'application/json'
      consumes 'application/json'

      parameter name: :cart_item, in: :body, schema:{
        type: :object,
        properties: {
           cart_item: {
            type: :object,
            properties: {
            
              product_name: {type: :string},
            
              product_price_in_cents: {type: :integer},
            
              quantity: {type: :integer},
            
            
              cart_id: {type: :integer},
            
              product_id: {type: :integer},
            
            }
          }
        }
      }

      response(200, 'successful') do
        let(:id) { cart_items.id}
        let(:cart_item) {{cart_item: {
        
          product_name: "Updated value",
        
          product_price_in_cents: 300,
        
          quantity: 300,
        
                                    }}}

        run_test! do |response|
          data=JSON.parse(response.body)
          
          expect(data['product_name']).to eql("Updated value")
          
          expect(data['product_price_in_cents']).to eql(300)
          
          expect(data['quantity']).to eql(300)
          
        end
      end
    end

    put('update cart_item') do
      produces 'application/json'
      consumes 'application/json'
      parameter name: :cart_item, in: :body, schema:{
        type: :object,
        properties: {
           cart_item: {
            type: :object,
            properties: {
            
              product_name: {type: :string},
            
              product_price_in_cents: {type: :integer},
            
              quantity: {type: :integer},
            
            
              cart_id: {type: :integer},
            
              product_id: {type: :integer},
            
            }
          }
        }
      }

      response(200, 'successful') do
        let(:id) { cart_items.id}
        let(:cart_item) {{cart_item: {
          
          product_name: "Updated value",
          
          product_price_in_cents: 300,
          
          quantity: 300,
          
                                    }}} 

        run_test! do |response|
          data=JSON.parse(response.body)
          
          expect(data['product_name']).to eql("Updated value")
          
          expect(data['product_price_in_cents']).to eql(300)
          
          expect(data['quantity']).to eql(300)
          
        end
      end
    end

    delete('delete cart_item') do
      
      response(204, 'successful') do
        let(:id) { cart_items.id}

        run_test! do |response|
          expect(response.status).to eql(204)
        end
      end
    end
  end
end
