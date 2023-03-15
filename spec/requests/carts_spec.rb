require 'swagger_helper'

RSpec.describe 'carts', type: :request do
  let(:carts) { create_carts}



  before do
    carts
  end

  path '/carts' do
    
    get('list carts') do
      produces 'application/json'

      response(200, 'successful') do

        run_test! do |response|
          data = JSON.parse(response.body)
          
          expect(data[0]['total']).to eql(Cart.first.total)
          
          expect(data[0]['price_in_cents']).to eql(Cart.first.price_in_cents)
          
          
        end
      end
    end

    post('create cart') do
      produces 'application/json'
      consumes 'application/json'

      parameter name: :cart, in: :body, schema:{
        type: :object,
        properties: {
          cart: {
            type: :object,
            properties: {
            
              total: {type: :integer},
            
              price_in_cents: {type: :integer},
            
            
            }
          }
        },
        required: [
        
          'total',
        
          'price_in_cents',
        
        
        ]
      }

      response(201, 'successful') do

        let(:cart) {{cart: {
        
          total: 10,
        
          price_in_cents: 10,
        
        
        }}}
          
        run_test! do |response|
          data=JSON.parse(response.body)
          
          expect(data['total']).to eql(10)
          
          expect(data['price_in_cents']).to eql(10)
          
        end
      end
    end
  end

  path '/carts/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show cart') do
      produces 'application/json'
      
      response(200, 'successful') do
        let(:id) { carts.id}

        run_test! do |response|
          data = JSON.parse(response.body)
          
          expect(data['total']).to eql(Cart.first.total)
          
          expect(data['price_in_cents']).to eql(Cart.first.price_in_cents)
          
          
        end
      end
    end

    patch('update cart') do
      produces 'application/json'
      consumes 'application/json'

      parameter name: :cart, in: :body, schema:{
        type: :object,
        properties: {
           cart: {
            type: :object,
            properties: {
            
              total: {type: :integer},
            
              price_in_cents: {type: :integer},
            
            
            }
          }
        }
      }

      response(200, 'successful') do
        let(:id) { carts.id}
        let(:cart) {{cart: {
        
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

    put('update cart') do
      produces 'application/json'
      consumes 'application/json'
      parameter name: :cart, in: :body, schema:{
        type: :object,
        properties: {
           cart: {
            type: :object,
            properties: {
            
              total: {type: :integer},
            
              price_in_cents: {type: :integer},
            
            
            }
          }
        }
      }

      response(200, 'successful') do
        let(:id) { carts.id}
        let(:cart) {{cart: {
          
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

    delete('delete cart') do
      
      response(204, 'successful') do
        let(:id) { carts.id}

        run_test! do |response|
          expect(response.status).to eql(204)
        end
      end
    end
  end
end
