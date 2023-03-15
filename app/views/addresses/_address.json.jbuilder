json.extract! address, :id, :user_id, :address, :street, :number, :district, :city, :state, :country, :postal_code, :type, :longitude, :latitude, :coordinates, :created_at, :updated_at
json.url address_url(address, format: :json)
