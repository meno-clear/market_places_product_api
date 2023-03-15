require "rails_helper"

RSpec.describe MarketPlacePartnersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/market_place_partners").to route_to("market_place_partners#index")
    end

    it "routes to #show" do
      expect(get: "/market_place_partners/1").to route_to("market_place_partners#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/market_place_partners").to route_to("market_place_partners#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/market_place_partners/1").to route_to("market_place_partners#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/market_place_partners/1").to route_to("market_place_partners#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/market_place_partners/1").to route_to("market_place_partners#destroy", id: "1")
    end
  end
end
