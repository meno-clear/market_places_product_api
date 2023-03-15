require 'swagger_helper'

RSpec.describe 'products', type: :request do
  let(:products) { create_products}



  before do
    products
  end

  path '/products' do
    
    get('list products') do
      produces 'application/json'

      response(200, 'successful') do

        run_test! do |response|
          data = JSON.parse(response.body)
          
          expect(data[0]['name']).to eql(Product.first.name)
          
          expect(data[0]['price_in_cents']).to eql(Product.first.price_in_cents)
          
          
        end
      end
    end

    post('create product') do
      produces 'application/json'
      consumes 'application/json'

      parameter name: :product, in: :body, schema:{
        type: :object,
        properties: {
          product: {
            type: :object,
            properties: {
            
              name: {type: :string},
            
              price_in_cents: {type: :integer},
            
            
            }
          }
        },
        required: [
        
          'name',
        
          'price_in_cents',
        
        
        ]
      }

      response(201, 'successful') do

        let(:product) {{product: {
        
          name: "Value",
        
          price_in_cents: 10,
        
        
        }}}
          
        run_test! do |response|
          data=JSON.parse(response.body)
          
          expect(data['name']).to eql("Value")
          
          expect(data['price_in_cents']).to eql(10)
          
        end
      end
    end
  end

  path '/products/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show product') do
      produces 'application/json'
      
      response(200, 'successful') do
        let(:id) { products.id}

        run_test! do |response|
          data = JSON.parse(response.body)
          
          expect(data['name']).to eql(Product.first.name)
          
          expect(data['price_in_cents']).to eql(Product.first.price_in_cents)
          
          
        end
      end
    end

    patch('update product') do
      produces 'application/json'
      consumes 'application/json'

      parameter name: :product, in: :body, schema:{
        type: :object,
        properties: {
           product: {
            type: :object,
            properties: {
            
              name: {type: :string},
            
              price_in_cents: {type: :integer},
            
            
            }
          }
        }
      }

      response(200, 'successful') do
        let(:id) { products.id}
        let(:product) {{product: {
        
          name: "Updated value",
        
          price_in_cents: 300,
        
                                    }}}

        run_test! do |response|
          data=JSON.parse(response.body)
          
          expect(data['name']).to eql("Updated value")
          
          expect(data['price_in_cents']).to eql(300)
          
        end
      end
    end

    put('update product') do
      produces 'application/json'
      consumes 'application/json'
      parameter name: :product, in: :body, schema:{
        type: :object,
        properties: {
           product: {
            type: :object,
            properties: {
            
              name: {type: :string},
            
              price_in_cents: {type: :integer},
            
            
            }
          }
        }
      }

      response(200, 'successful') do
        let(:id) { products.id}
        let(:product) {{product: {
          
          name: "Updated value",
          
          price_in_cents: 300,
          
                                    }}} 

        run_test! do |response|
          data=JSON.parse(response.body)
          
          expect(data['name']).to eql("Updated value")
          
          expect(data['price_in_cents']).to eql(300)
          
        end
      end
    end

    delete('delete product') do
      
      response(204, 'successful') do
        let(:id) { products.id}

        run_test! do |response|
          expect(response.status).to eql(204)
        end
      end
    end
  end
end
