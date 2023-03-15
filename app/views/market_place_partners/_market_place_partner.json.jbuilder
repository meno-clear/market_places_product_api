json.extract! market_place_partner, :id, :name, :email, :cnpj, :status, :user_id, :created_at, :updated_at
json.logo market_place_partner.logo.attached? ? Rails.application.routes.url_helpers.rails_blob_path(market_place_partner.logo) : nil
json.url market_place_partner_url(market_place_partner, format: :json)
