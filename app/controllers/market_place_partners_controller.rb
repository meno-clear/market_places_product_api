class MarketPlacePartnersController < ApplicationController
  before_action :set_market_place_partner, only: %i[ show update destroy ]

  # GET /market_place_partners
  # GET /market_place_partners.json
  def index
    @market_place_partners = MarketPlacePartner.all
  end

  # GET /market_place_partners/1
  # GET /market_place_partners/1.json
  def show
  end

  # POST /market_place_partners
  # POST /market_place_partners.json
  def create
    @market_place_partner = MarketPlacePartner.new(market_place_partner_params)

    if @market_place_partner.save
      render :show, status: :created, location: @market_place_partner
    else
      render json: @market_place_partner.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /market_place_partners/1
  # PATCH/PUT /market_place_partners/1.json
  def update
    if @market_place_partner.update(market_place_partner_params)
      render :show, status: :ok, location: @market_place_partner
    else
      render json: @market_place_partner.errors, status: :unprocessable_entity
    end
  end

  # DELETE /market_place_partners/1
  # DELETE /market_place_partners/1.json
  def destroy
    @market_place_partner.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_market_place_partner
      @market_place_partner = MarketPlacePartner.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def market_place_partner_params
      params.require(:market_place_partner).permit(:name, :email, :cnpj, :status, :user_id)
    end
end
